![UPSkill](https://upskill.pt/wp-content/uploads/2021/10/Logo_UPskill_VERDE-1.jpg)


|Innovative Logistics |Links |
| ------ | ------ |
|Flávio Eleutério| [GitHub](https://github.com/Jammer23rd) - [Email](mailto:flavioept@gmail.com) - [Telefone](tel:00351918396034)|
|Rogélio Ribeiro| [GitHub](https://github.com/Rovez) - [Email](mailto:rogelioribeiro@hotmail.com) - [Telefone](tel:00351935429255) |
|Márcio Clara|[GitHub](https://github.com/MClara10) - [Email](mailto:marcio_clara@hotmail.com) - [Telefone](tel:00351916817578)|

# Frontend

> Static Web App
- Criar uma Static Web App
- Definir Github como source do deployment
- Clonar e usar seguinte repositório de Github - [Aqui](https://github.com/Jammer23rd/webrfid) 

# Backend

> Azure Database for SQL
- Criar Azure Database for SQL
- Abrir Powershell no Azure
- Correr o seguinte comando:
```sh
mysql -- host={server_name}.database.azure.com --user={server_admin_name}@{server} -p
```
- Colocar password quando requerida
- Correr script de backup de dase de dados - [database_fields_backup.sql](https://github.com/Jammer23rd/upskill_files) 
- Correr script de criação de dados para teste - [database_creation _backup.sql](https://github.com/Jammer23rd/upskill_files) 
- Correr script de criação de utilizador teste - [create_test_user.sql](https://github.com/Jammer23rd/webrfid) 

####  Arquitetura não totalmente implementada

> Azure Function
- Na integração na página tracking do website
- Recolher info do <input name=tag> ao pressionar o botão
- Verificar existência de tag na tabela tag da Base de dados
- Erro ou Envio de localização de tag
- Integração na API do google maps para visualização
- JS das Azure Functions criada - [Aqui](https://github.com/Jammer23rd/upskill_files) 

> IOT Hub
- Integração de IOT Hub com leitores de RFID
- Criação efetuada na plataforma Azure
- Integração parcial / Ineficaz com a base de dados MySQL através da Stream Analytics
####  Arquitetura não implementada
> Stream Analytics
- Não implementado

file made in dilinger.io 