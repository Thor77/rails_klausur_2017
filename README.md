Vorbereitung
============

* Mache die folgenden Abschnitte von http://guides.rubyonrails.org/index.html offline verfügbar:
    * Models
    * Views
    * Controllers
    * Digg Deeper
        * Active Support Core Extensions
        * Rails Internationalization API
        * Active Job Basics
        * Securing Rails Applications
        * Debugging Rails Applications
        * Configuring Rails Applications
        * Rails Command Line Tools and Rake Tasks
        * Asset Pipeline
        * Working with JavaScript in Rails
        
* Diese Website gibt es auch in einer Offline-Version (incl. Suche) http://devdocs.io
* Setze dein System auf und stelle sicher, dass der Test läuft und grün ist. (`rake test`)
* Diese Themen werden behandelt:
    * CSS-Selektoren
    * Scaffolding
    * Verwendung regulärer Ausdrücke in Ruby (gsub, =~, matches)
    
Anfangszustand
==============
`48 tests, 0 assertions, 0 failures, 48 errors, 0 skips`

Aufgabe
=======

Erstelle ein Programm zur Verwaltung von verteilten Datenbanken. Dazu sind folgende Modelle notwendig (Beim Generator die Option -s nicht vergessen!):

* User
    * email:string
    * username:string
    * password_digest:string
    * Hat mehrere Databases
* Environment
    * name:string
    * Hat mehrere Hosts
* Host
    * hostname:string
    * ip:string
    * operating_system:string
    * Gehört zu genau einer Umgebung
    * Hat viele Datenbanken
* Database
    * name:string
    * description:text
    * Läuft auf vielen Hosts
    * Hat mehrere User

Weiteres Vorgehen
-----------------

* Erzeuge die notwendigen Modelle, Tabellen und Join-Tabellen
* Der `root_path` soll auf `'databases#index'` zeigen.
* Zu einigen Tests finden sich in den jeweiligen Kommentaren zu dem Test weitere Hinweise zur Implementierung. 
* Bearbeitungszeit: 90 Minuten

Abgabe
======

Kopiere diesen ganzen Ordner auf den USB-Stick. Benenne den Ordner in deine Matrikelnummer um!

Kompatibilität:
---------------
Die Klausur wurde mit den folgenden Ruby-Versionen erfolgreich getestet:
 * Windows `2.2.6`, `2.3.0`, `2.3.3`
 * Mac `2.2.7`, `2.3.4`, `2.4.1`
 * Linux `2.2.7`, `2.3.4`, `2.4.1`