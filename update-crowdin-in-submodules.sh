for i in alerts ala-cas-5 collectory-plugin biocache-service biocache-hubs bie-plugin bie-index image-service userdetails specieslist-webapp spatial-service spatial-hub regions downloads-plugin
do
    cp crowdin-configs/$i-crowdin.yml $i/crowdin.yml
done
