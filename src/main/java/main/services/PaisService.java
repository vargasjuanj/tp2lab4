package main.services;
import main.entities.Pais;
import main.repositories.PaisRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;


@Service
public class PaisService extends ServicioGenerico<Pais, PaisRepository> {
    /*
    @Bean : le dice a Spring 'aquí hay una instancia de esta clase, por favor manténgala y devuélvamela cuando pregunte'.
@Autowired : dice 'por favor, dame una instancia de esta clase, por ejemplo, una que haya creado con una @Beananotación anterior
     */
    List<String>regUpdated= new ArrayList<>();
    List<String>regSaved= new ArrayList<>();
    private static final Logger log = LoggerFactory.getLogger(PaisService.class);
    private long countSaved=0, countUpdated=0;
    @Autowired
    private PaisRepository paisRepository;
    private String uri;

    @Bean //Si pusiera este Bean en consumeApi, se ejecutaria automaticamente sin necesitar una petición de postman o el navegador. .
    public RestTemplate createRestTemplate() {
        return new RestTemplateBuilder().build();
    }

    public List<Pais> consumeApi() throws Exception {
        RestTemplate restTemplate = createRestTemplate(); //RestTemplate es sincrono, WebClient lo reemplazará y es asincrono
        uri = "https://restcountries.eu/rest/v2/callingcode/";
        Pais[] pais;

        for (int code = 1; code <= 300; code++) {

            try {
                pais = restTemplate.getForObject(
                        uri + code, Pais[].class);
                //log.info(pais[0].toString());
                updatedOrSaved(pais[0]);
            } catch (Exception e) {
                log.info("Registration with code  " + code + " does not exist in " + uri + code);

            }
        }

        log.info("Updated records " +regUpdated.toString());
        log.info("Saved records" +regSaved.toString());
        log.info(getCountUpdated()+" records updated in total");
        log.info(getCountSaved()+" records saved in total");
        uri = null;

        return findAll();
    }

    @Transactional
    public void updatedOrSaved(Pais dto) throws Exception {


        try {

            Pais entity = paisRepository.findByCodigoPais(dto.getCallingCodes()[0]);
            Pais aux=new Pais(entity);
            aux.setDate(null); //Seteo a null para poder comparar, lo hago con aux, porque si seteo entity, me deja las fechas a null
            dto=prepare(dto, aux.getId());  //seteo codigoPais y coordenadas; y anulo el array callingCodes y el  latlng para poder comparar bien
           // log.info("ENTITY: "+entity.toString());
            //log.info("DTO: "+dto.toString());
            if (aux.equals(dto)) {

                log.info("No changes found, no new records");
                return;
            } else {
                save(dto); //En este caso el método save actualiza
                regUpdated.add(dto.toString());
                countUpdated++;
                log.info("Updated successfully, code "+dto.getCodigoPais());
            }
        }catch(Exception e) {
            dto=prepare(dto,0);
            save(dto);   //Si el id no existe en la base de datos, guarda el registro
            regSaved.add(dto.toString());
            countSaved++;
            log.info("Saved successfully, code "+dto.getCodigoPais());
            return;

        }

    }

    public Pais prepare(Pais dto, long id){
        dto.setCodigoPais(dto.getCallingCodes()[0]); //Establezco código capturado como array de un json  (no persistente, transient ) en un atributo si persistente
        dto.setLatitud(dto.getLatlng()[0]); //Establezco latitud del array latlng capturado del json
        dto.setLongitud(dto.getLatlng()[1]); //Establezco longitud
       dto.setId(id);
        //Para poder realizar la comparación dejo estos a null, porque son transient, no se persisten.
        dto.setLatlng(null);
        dto.setCallingCodes(null);
     //   dto.setDate(null); //En el caso que traiga la fecha del FrontEnd
        return dto;
    }

    public long getCountSaved() {
        return countSaved;
    }

    public long getCountUpdated() {
        return countUpdated;
    }

}