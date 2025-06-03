package ger_taskv1.Model;


import jakarta.persistence.*;
import lombok.Data;


@Entity
@Data
@Table(name = "quadro")  // Using @Table to specify the table name in the database 
public class Quadro {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)    // Use @GeneratedValue to auto-generate the ID
    private Integer id;

    @Column(name = "responsavel")
    private String responsavel;
    
    @Column(name = "membros")
    private String membros;

}