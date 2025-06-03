CREATE TABLE usuario (
  id SERIAL PRIMARY KEY,
  login VARCHAR(32) NOT NULL UNIQUE,
  senha VARCHAR(32) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE quadro (
  id SERIAL PRIMARY KEY,
  responsavel VARCHAR(50) NOT NULL,
  membros VARCHAR(255) NOT NULL
);

CREATE TABLE cartao (
  id SERIAL PRIMARY KEY,
  responsavel VARCHAR(255) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  quadro_id INTEGER NOT NULL,
  CONSTRAINT fk_cartao_quadro
    FOREIGN KEY (quadro_id)
    REFERENCES quadro(id)
);

CREATE TABLE tarefas (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  concluida BOOLEAN
);

CREATE TABLE usuario_has_quadro (
  usuario_id INTEGER NOT NULL,
  quadro_id INTEGER NOT NULL,
  PRIMARY KEY (usuario_id, quadro_id),
  CONSTRAINT fk_usuario_has_quadro_usuario
    FOREIGN KEY (usuario_id)
    REFERENCES usuario(id),
  CONSTRAINT fk_usuario_has_quadro_quadro
    FOREIGN KEY (quadro_id)
    REFERENCES quadro(id)
);

CREATE TABLE tarefas_has_cartao (
  tarefas_id INTEGER NOT NULL,
  cartao_id INTEGER NOT NULL,
  PRIMARY KEY (tarefas_id, cartao_id),
  CONSTRAINT fk_tarefas_has_cartao_tarefas
    FOREIGN KEY (tarefas_id)
    REFERENCES tarefas(id),
  CONSTRAINT fk_tarefas_has_cartao_cartao
    FOREIGN KEY (cartao_id)
    REFERENCES cartao(id)
);