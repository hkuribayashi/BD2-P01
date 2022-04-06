from sqlalchemy import Column, Integer, String, create_engine, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, relationship

# Para utilizar o debug utilizar deve-se adicionar ``echo=True``:
engine = create_engine('mysql+pymysql://root:12345678@localhost/usuarios', echo=True)
# engine = create_engine('sqlite:///:memory:', echo=True)

# Criando uma classe "Session" já configurada.
# Session é instanciado posteriormente para interação com a tabela.
Session = sessionmaker(bind=engine)
Base = declarative_base()


class Usuario(Base):
    """Cada classe representa uma tabela do banco"""
    # Nome da tabela, se a variável não for
    # declarada será utilizado o nome da classe.
    __tablename__ = 'usuarios'

    # Colunas da tabela.
    id = Column(Integer, primary_key=True)
    nome = Column('nome', String(32))
    idade = Column('idade', Integer)
    sexo = Column('sexo', String(10))

    def __init__(self, nome, idade, sexo):
        self.nome = nome
        self.idade = idade
        self.sexo = sexo


class Endereco(Base):
    __tablename__ = 'enderecos'
    id = Column(Integer, primary_key=True)
    rua = Column('rua', String(32))
    bairro = Column('bairro', String(32))
    cidade = Column('cidade', String(32))
    estado = Column('estado', String(32))
    usuario_id = Column(Integer, ForeignKey('usuarios.id'))
    usuario = relationship("Usuario")


if __name__ == "__main__":
    # Removendo todas as tabelas do banco.
    Base.metadata.drop_all(engine)

    # Criando todas as tabelas.
    Base.metadata.create_all(engine)

    # Criando uma sessão (add, commit, query, etc).
    session = Session()

    # Criando os dados que serão inseridos na tabela.
    # Classe com o construtor.
    usuario_1 = Usuario('Joao', 35, 'Masculino')
    endereco_1 = Endereco(rua='Av. J', bairro='Nova Marabá', cidade='Marabá', estado='Pará', usuario=usuario_1)

    # Pode-se crirar usuarios por meio de uma coleção
    # usuarios = [Usuario('Maria', 20, 'Feminino'), Usuario('Pedro', 50, 'Masculino')]

    # Inserindo registro na tabela.
    session.add(usuario_1)
    session.add(endereco_1)


    # Inserindo vários registros na tabela.
    # session.add_all(usuarios)

    # Persistindo os dados.
    session.commit()

    # Segundo Teste de Inserção
    # usuario_2 = Usuario('Aline', 22, 'Feminino')
    # session.add(usuario_2)

    # usuario = session.query(Usuario).filter_by(nome='Aline').first()
    # if usuario is usuario_2:
    #     print("instancia usuario é Aline")
    # else:
    #     print("instancia usuario não é Aline")

    # session.rollback()

    # Consultar todos os registros.
    dados = session.query(Usuario).all()
    print(dados)
    for linha in dados:
        print(f'Nome: {linha.nome} - Idade: {linha.idade} - Sexo: {linha.sexo}')

    # Consulta registros com filtro.
    # dados = session.query(Usuario).filter(Usuario.idade > 40).all()
    # print(dados)
    # for linha in dados:
    #    print(f'Nome: {linha.nome} - Idade: {linha.idade} - Sexo: {linha.sexo}')

    # Alterar um registro da tabela.
    # print('Nome ANTES da alteração:', session.query(Usuario).filter(Usuario.id == 1).one().nome)
    # session.query(Usuario).filter(Usuario.id == 1).update({'nome': 'Roberto'})
    # session.commit()
    # print('Nome DEPOIS da alteração:', session.query(Usuario).filter(Usuario.id == 1).one().nome)

    # Remover um registro da tabela.
    # print('Registro ANTES da remoção:', session.query(Usuario).filter(Usuario.id == 1).one_or_none())
    # session.query(Usuario).filter(Usuario.id == 1).delete()
    # session.commit()
    # print('Registro DEPOIS da remoção:', session.query(Usuario).filter(Usuario.id == 1).one_or_none())

    # Fechando a sessão.
    # session.close()
