for i in alerts ala-cas-5 collectory biocache-service biocache-hubs ala-bie-hub bie-index doi-service image-service userdetails specieslist-webapp spatial-service spatial-hub regions downloads-plugin ecodata biocollect
do
    cp crowdin-configs/$i-crowdin.yml $i/crowdin.yml
done
