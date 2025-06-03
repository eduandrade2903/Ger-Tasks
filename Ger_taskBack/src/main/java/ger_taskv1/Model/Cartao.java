package ger_taskv1.Model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class Cartao {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column (name = "responsavel")
    private String responsavel;
    @Column (name = "descricao")
    private String descricao;
    @Column (name = "nome")
    private String nome;


    @ManyToOne
    @JoinColumn(name = "quadro_id", referencedColumnName = "id")
    private Quadro quadro;

}
