package main.dtos;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.Arrays;

@JsonIgnoreProperties(ignoreUnknown = true)
public class PaisDTO {
    @JsonProperty("callingCodes")
    private Integer[] codigoPais;


    @JsonProperty("name")
    private String nombrePais;

    @JsonProperty("capital")
    private String capitalPais;

    private String region;
    @JsonProperty("population")
    private int poblacion;

    @JsonProperty("latlng")
    private double[] latlng;


    public Integer[] getCodigoPais() {
        return codigoPais;
    }

    public void setCodigoPais(Integer[] codigoPais) {
        this.codigoPais = codigoPais;

    }

    public String getNombrePais() {
        return nombrePais;
    }

    public void setNombrePais(String nombrePais) {
        this.nombrePais = nombrePais;
    }

    public String getCapitalPais() {
        return capitalPais;
    }

    public void setCapitalPais(String capitalPais) {
        this.capitalPais = capitalPais;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public int getPoblacion() {
        return poblacion;
    }

    public void setPoblacion(int poblacion) {
        this.poblacion = poblacion;
    }

    public double[] getLatlng() {
        return latlng;
    }

    public void setLatlng(double[] latlng) {
        this.latlng = latlng;
    }

    @Override
    public String toString() {
        return "PaisDTO{" +
                "codigoPais=" + Arrays.toString(codigoPais) +
                ", nombrePais='" + nombrePais + '\'' +
                ", capitalPais='" + capitalPais + '\'' +
                ", region='" + region + '\'' +
                ", poblacion=" + poblacion +
                ", latitud=" + latlng[0] +
                ", longitud=" + latlng[1] +
                '}';
    }
}
