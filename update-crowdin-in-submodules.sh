for i in collectory-plugin biocache-service biocache-hubs bie-plugin bie-index image-service userdetails specieslist-webapp spatial-service spatial-hub regions downloads-plugin
do
    cp crowdin-configs/$i-crowdin.yml $i/crodwin.yml
done
