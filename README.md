<h1 align="center">Welcome to Fire Inspection Service 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000" />
  <a href="https://opensource.org/licenses/MIT" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
</p>
<p>
A JSP Service for managing Fire Inpections. In version 1.0.0 the main functonality are CRUD operations on the inspections and adding defects.
</p>

 >⚠️ This web service was created for the lecture Service Engineering (WS 2021/22) by the [Institute of Service Engineering](https://www.jku.at/institut-fuer-wirtschaftsinformatik-software-engineering/) at the [Johannes Kepler University Linz](https://www.jku.at/). ⚠️


### 🏠 [Homepage](https://github.com/Bauinger/fire-inspection-service)

![Appointment Overview Side](https://github.com/Bauinger/fire-inspection-service/blob/main/images/appointment_overview.png)

## Stack:
- Jakarta Server Pages
- Bootstrap 5
- MySQL

## Preperations:

### 💾 Database DDL Statments:

```sql
create table inspections
(
    id                     int auto_increment
        primary key,
    address                varchar(200)                              not null,
    building               varchar(200)                              not null,
    owner                  varchar(200)                              not null,
    meeting_start          datetime                                  not null,
    meeting_end            datetime                                  not null,
    appraiser              varchar(200)                              not null,
    telephone_number_owner varchar(100)                              not null,
    email_owner            varchar(200)                              not null,
    meeting_status         enum ('pending', 'canceled', 'completed') not null
);


create table defects
(
    id int auto_increment primary key,
    defect varchar(200) not null,
    meeting_status enum ('critical', 'high', 'normal', 'low') not null,
    inspection_id int not null,
    constraint defects_inspections_id_fk
    foreign key (inspection_id) references inspections (id)
    on delete cascade
);
```
### 🤖 A word to Deployment/Server:

> I used for [XAMPP](https://www.apachefriends.org/de/index.html) for development purposes. It's an Open Source WebServer from the Apache Foundation, that provides a tomcat server for deploying the JSP Application and a MySql Database for your data. Feel free to us it.


##  Description of the Applicatiom (German)
### Funktionsumfang
> Die Feuerbeschau stellt eine Überprüfung des Objektes (z.B. Haus, Firmengebäude, …) durch einen Gemeindebediensteten und einen Sachverständigen dar. Dabei werden, gemeinsam mit dem Eigentümer und eventuell dem zuständigen Feuerwehrkommandanten und Rauchfangkehrermeister alle Räume des Objekts kontrolliert. Die Kommission stellt dann dabei fest, ob sich das Gebäude in einem brandschutztechnisch sicheren Zustand befindet, ob es Bauschäden oder elektrische Anlagen gibt, die einen Brand auslösen könnten und auch, ob Geräte zur Brandbekämpfung (z.B. Feuerlöscher) vorhanden und auch auf Funktionstüchtigkeit geprüft wurden.

> Damit diese Kontrollen, bei denen verschiedenste Personen beteiligt sind, gut organisieren zu können und dabei einen Überblick über bereits abgeschlossene und noch ausständige Feuerbeschauen zu bekommen, wurde dieses Tool entwickelt. Hier kann eine neue Feuerbeschau geplant und angelegt werden. Zu einer Beschau werden dabei die benötigten Daten, wie z.B. Adresse des Objektes, Zeitpunkt der Beschau, Objekteigentümer und der verantwortliche Sachverständige erfasst und zentral in einer Datenbank gespeichert. Eine bereits angelegte Feuerbeschau kann im Nachhinein wieder bearbeitet werden, um beispielsweise ein geändertes Datum einzutragen bzw. um den Status der Beschau anzupassen. Zudem kann eine geplante Feuerbeschau wieder gelöscht werden und die einzelnen Details werden dem Benutzer in einer Listenform angezeigt.
### Kodierung
> In den Jakarta Server Pages Dateien wurde mittels UTF-8 kodiert. UTF-8 wird durch den UNICODE Standard definiert. Es werden jedem Zeichen eigene kodierte Zeichenketten variabler Länge zugeordnet. Hier gibt es Zeichenketten mit bis zu vier Bytes. Die Zuordnung eines Zeichens zur kodierten Zeichenkette erfolgt über einen Algorithmus. Die ersten 128 Zeichen sind dabei identisch mit den ASCII-Zeichen. Da es sich in diesem konkreten Fall um eine Webanwendung handelt, ist es üblich, dass für Webseiten UTF-8 verwendet wird. Laut der Statistik von W3Techs nutzen 97,5% der Webseiten, auf welche zugegriffen werden konnte, UTF-8 als Kodierung .
### Protokolle
> Jakarta Server Pages erhalten eine Anfrage vom Client mittels einer http-Anfrage. Das Protokoll, welches von Jakarta Server Pages angewandt ist, ist daher HTTP.  HTTP ist ein zustandsloses Protokoll zur Übertragung von Daten auf der Anwendungsschicht. Der Client stellt eine HTTP-Anfrage an eine bestimmte Webanwendung in einem Webserver. JSPs werden unter Verwendung eines JSP-Compilers in Java Quellcode umgewandelt. Dieser Quellcode entspricht einem Servlet und wird dann im Anschluss in Bytecode umgewandelt. Die so erzeugten Java Klassen können dann vom Webserver ausgeführt werden. Und durch eine HTTP-Response als Antwort auf die Anfrage des Clients zurückgegeben werden. 
## Author

👤 **Bernhard Auinger**

* Website: https://github.com/Bauinger
* Github: [@Bauinger](https://github.com/Bauinger)

## Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2021 [Bernhard Auinger](https://github.com/Bauinger).<br />
This project is [MIT](https://opensource.org/licenses/MIT) licensed.

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_