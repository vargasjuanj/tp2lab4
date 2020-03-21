package main.controllers;


import main.ConsumingRestApplication;
import main.dtos.PaisDTO;
import main.services.PaisService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
@RestController
@RequestMapping(path = "api/v1/paises")
public class PaisController {
    private static final Logger log = LoggerFactory.getLogger(ConsumingRestApplication.class);
private PaisService paisService;
public PaisController(PaisService paisService){
    this.paisService=paisService;
}


    @Bean

    public RestTemplate restTemplate(RestTemplateBuilder builder) {
        return builder.build();
    }

    @Bean
    public CommandLineRunner run(RestTemplate restTemplate) throws Exception {
    String url = "https://restcountries.eu/rest/v2/callingcode/";
        PaisDTO[] pais;

        for (int id = 1; id <= 300; id++) {

            try {
                pais = restTemplate.getForObject(
                        url + id, PaisDTO[].class);
                //log.info(pais[0].toString());
                paisService.updatedOrSaved(pais[0]);
            } catch (Exception e) {
                log.info("id " + id + " does not exist in " + url+id);

            }
        }
        log.info(paisService.getCountUpdated()+" updated registries");
        log.info(paisService.getCountSaved()+" saved registries");

        return null;
    }

}
