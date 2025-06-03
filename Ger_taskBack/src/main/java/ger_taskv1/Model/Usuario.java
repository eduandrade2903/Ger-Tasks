package ger_taskv1.Model;

import jakarta.persistence.Entity;
import lombok.Data;

@Entity
@Data
public class Usuario {
    
    private Integer id; 
    private String nome;
    private String login;
    private String senha;
    private String email;

}