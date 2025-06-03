package ger_taskv1.Model;

import jakarta.persistence.Entity;
import lombok.Data;

@Entity
@Data
public class Cartao {

    private Integer id;
    private String responsavel;
    private String descricao;
    private String nome;

    private Quadro quadro;

}
