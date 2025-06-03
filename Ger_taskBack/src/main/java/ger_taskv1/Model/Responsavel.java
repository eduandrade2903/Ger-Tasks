package ger_taskv1.Model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "usuario_has_quadro")
// Using @Table to specify the table name in the database
public class Responsavel {

    @Id
    @Column(name = "id")
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "usuario_id", nullable = false, insertable = false, updatable = false)
    private Usuario usuario;

    @ManyToOne
    @JoinColumn (name = "quadro_id", nullable = false, insertable=false, updatable=false)
    private Quadro quadro;
}