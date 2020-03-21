package main.services;


import main.ConsumingRestApplication;
import main.dtos.PaisDTO;
import main.entities.Pais;
import main.repositories.PaisRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Optional;

@Service
public class PaisService {
    private static final Logger log = LoggerFactory.getLogger(ConsumingRestApplication.class);
    private PaisRepository paisRepository;
    private Integer countSaved=0, countUpdated=0;
    public PaisService(PaisRepository paisRepository) {
        this.paisRepository = paisRepository;
    }

    @Transactional
    public void updatedOrSaved(PaisDTO dto) {
       int  id = dto.getCodigoPais()[0];
        Optional<Pais> entityOptional = paisRepository.findById(id);
        Pais entity, compare = new Pais();

        try {

            entity = entityOptional.get();
            compare.setCodigoPais(dto.getCodigoPais()[0]);
            compare.setNombrePais(dto.getNombrePais());
            compare.setCapitalPais(dto.getCapitalPais());
            compare.setPoblacion(dto.getPoblacion());
            compare.setRegion(dto.getRegion());
            compare.setLatitud(dto.getLatlng()[0]);
            compare.setLongitud(dto.getLatlng()[1]);


            if (entity.toString().equals(compare.toString())) return;

            update(compare, dto);


        }catch(Exception e){


            save(dto);
            
        }

    }

    @Transactional
    public PaisDTO update(Pais entity, PaisDTO dto) {
        Integer id = dto.getCodigoPais()[0];
        try {
            paisRepository.save(entity);
            countUpdated++;
            log.info("registry " + id + " updated successfully!");
        } catch (Exception e) {
            log.info("error saving id  " + id);
        }


        return dto;
    }

    @Transactional
    public PaisDTO save(PaisDTO dto) {
        Integer id = dto.getCodigoPais()[0];
        // creo la entidad a persistir
        Pais entity = new Pais();
        entity.setCodigoPais(dto.getCodigoPais()[0]);
        entity.setNombrePais(dto.getNombrePais());
        entity.setCapitalPais(dto.getCapitalPais());
        entity.setPoblacion(dto.getPoblacion());
        entity.setRegion(dto.getRegion());
        entity.setLatitud(dto.getLatlng()[0]);
        entity.setLongitud(dto.getLatlng()[1]);
        try {


            entity = paisRepository.save(entity);
            // cargo el id manual
            Integer[] code = new Integer[1];
            code[0] = entity.getCodigoPais();
            dto.setCodigoPais(code);
            countSaved++;
            log.info("registry " + id + " saved successfully!");


        } catch (Exception e) {
            log.info("error updating id " + id);


        }
        return dto;

    }

    public Integer getCountSaved() {
        return countSaved;
    }

    public void setCountSaved(Integer countSaved) {
        this.countSaved = countSaved;
    }

    public Integer getCountUpdated() {
        return countUpdated;
    }

    public void setCountUpdated(Integer countUpdated) {
        this.countUpdated = countUpdated;
    }
}
