package ger_taskv1.Model;



import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class Tarefas {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "nome")
    private String nome;
    @Column(name= "concluida")
    private Boolean concluida;

}