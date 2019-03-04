# dehydrated-googlecloud-lexicon-hook
## Running
Run the following `docker` command from the host's root's cron as you see fit.

* `<path_to_gcloud_config>`: gcloud-sdk's config dir
* `<path_to_dehydrated_conf_dir>`: dehydrated config dir
* docker run --rm -v `<path_to_gcloud_config>`:/root/.config -v `<path_to_dehydrated_conf_dir>`:/etc/dehydrated xbglowx/dehydrated-googlecloud-hook -c -k hooks/dehydrated.default.sh

Example:

    docker run --rm -v /home/dehydrated/.config:/root/.config -v /etc/dehydrated:/etc/dehydrated xbglowx/dehydrated-googlecloud-hook -c -k hooks/dehydrated.default.sh
