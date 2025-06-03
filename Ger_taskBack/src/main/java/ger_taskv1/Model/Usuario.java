package ger_taskv1.Model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "nome")
    private String nome;
    @Column (name = "login")
    private String login;
    @Column(name = "senha")
    private String senha;
    @Column(name = "enail")
    private String email;

}