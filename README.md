# EMN2016 - Utilisation de Docker

## Prérequis

* Récupérer les ressources binaires présentes sur la clé USB (tomcat et jdk)
* Les copier dans le répertoire **tomcat**

## Manipulation du Dockerfile

Avec l'aide de la documentation en ligne sur la création d'un ficher Dockerfile et des examples dans le support de présentation, nous créons une image pour mettre en place un serveur Tomcat qui répond à la procédure d'installation suivante :

* L'image doit se baser sur l'image **ubuntu 14.04**
* Présence de **Java en version 1.7** (Installer le JDK 1.7 en utilisant l'archive `tomcat/jdk-7u71-linux-x64.gz` fournie)
  * Notes : le fichier **jdk-7u71-linux-x64.gz** une fois décompressé crée le répertoire **jdk1.7.0_71**
* Présence de **Tomcat en version 7.0.57 ** (Utiliser l'archive `tomcat/apache-tomcat-7.0.57.tar.gz` fournie)
  * Note : le fichier **apache-tomcat-7.0.57** une fois décompressé crée le répertoire **apache-tomcat-7.0.57**
* La variable d'environnement **JAVA_HOME** est correctement renseignée
* Le port 8080 est exposé
* Le conteneur doit démarrer le serveur Tomcat.
  * Note : pour démarrer Tomcat, exécuter `catalina.sh run` du répertoire `apache-tomcat-7.0.57/bin``

Une fois le fichier **Dockerfile** complété, construire l'image via la commande `docker build` en spécifiant le tag `handson/myapp-server`.

Vérifier que l'image a bien été créée via la commande `docker images`.

### 2.2- Démarrage du conteneur du serveur d'applications

Démarrer le conteneur à partir de l'image `handson/myapp-server` avec :
 * le nom d'image `myapp-server`
 * l'application est accessible sur le **port 8080**

#### Vérification
Vérifier que le conteneur a bien été démarré via la commande `docker ps`.

Si le conteneur n'est pas visible via `docker ps`, essayez alors avec `docker ps -a` qui affiche les conteneurs démarrés et arrêtés. En effet, en cas d'erreur, le conteneur démarré est arrêté aussitôt.

La commande `docker logs [nom du conteneur]` affiche la sortie console dans le conteneur ce qui permet de vérifier que le serveur Tomcat est bien démarré et qu'il n'y a pas eu d'erreur au démarrage.

#### En cas d'erreur
Il est possible de supprimer le conteneur en l'arrêtant via `docker stop [nom du conteneur]` puis `docker rm [nom du conteneur]`.

Si l'erreur provient du fichier **Dockerfile**, nous avons alors à supprimer le conteneur, à corriger ce fichier **Dockerfile**, à recontruire l'image via `docker build` puis à redémarrer le conteneur via `docker run`.
