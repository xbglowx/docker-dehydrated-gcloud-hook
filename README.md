# dehydrated-lexicon-hook
## Running
Run the following `docker` command from the host's root's cron as you see fit.

* `<path_to_dehydrated_conf_dir>`: dehydrated config dir
* docker run --rm -v `<path_to_dehydrated_conf_dir>`:/etc/dehydrated xbglowx/dehydrated-lexicon-hook

Example:
    docker run --rm -v /etc/dehydrated:/etc/dehydrated xbglowx/dehydrated-lexicon-hook
