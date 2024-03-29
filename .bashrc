#laravel aliases
alias phpunit='vendor/bin/phpunit'
alias pf="phpunit --filter "
alias fresh="php artisan migrate:fresh --seed"
alias artcc="php artisan clear-compiled"
alias cdo="composer dump-autoload -o"
alias cnoa="composer install --optimize-autoloader --no-dev"
alias sail="vendor/bin/sail"
alias session-flush="rm -f storage/framework/sessions/*"

#npm aliases
alias nrd="npm run dev"
alias nrp="npm run prod"
alias nrw="npm run watch"

#vite aliases
alias vb="npm run build"
alias vp="npm run preview"

#wordpress aliases
alias wp="cd /c/laragon/www-wordpress/"
alias wpt="cd web/app/themes/"

#git aliases
alias gac="git add . && git commit -a -m "
alias wip="git add . && git commit -m 'wip' && git push"
alias nah="git reset --hard && git clean -df"
alias pusherok="git push heroku heroku:main"
alias wiperok="git add . && git commit -m 'wip heroku' && git push heroku heroku:main"

#other aliases
alias vue='winpty vue.cmd'
alias botmanclr="php artisan botman:cache:clear && php artisan cache:clear  && php artisan config:clear"

function homestead() {
    ( cd ~/Homestead && vagrant $* )
}

function art() {
    php artisan "$@"
}

function artroku() {
    heroku run php artisan "$@"
}

function laragon() {
	cd /c/laragon/www/$*
}

function npm_reset() {
    red=`tput setaf 1`
    yellow=`tput setaf 3`
    reset=`tput sgr0`

    rm -rf node_modules
    echo "${yellow}node_modules ${red}removed!${reset}"
    rm package-lock.json
    echo "${yellow}package-lock.json ${red}removed!${reset}"
    test -f yarn.lock && rm yarn.lock && echo "${yellow}yarn.lock ${red}removed!${reset}"
    npm cache clear --force
    echo "${yellow}npm cache ${red}cleared!${reset}"

    printf "\nyou can now ${yellow}npm install && npm run dev${reset}"
}

function reload() {
	. ~/.bashrc;
	echo "\". ~/.bashrc\" reloaded";
}

function randomEp() {
	SEASON=$1;
	EPISODE=$2;

	echo 'Se'$((1 + $RANDOM % SEASON))'Ep'$((1 + $RANDOM % EPISODE));
}

function bonak() {
	# tput setab [1-7] ANSI background color
	# tput setaf [1-7] ANSI foreground color

	green=`tput setaf 2`
	cyan=`tput setaf 6`
	reset=`tput sgr0`

	echo -e "
${green}laravel aliases
  ${cyan}phpunit            ${reset}vendor/bin/phpunit
  ${cyan}pf                 ${reset}phpunit --filter
  ${cyan}fresh              ${reset}php artisan migrate:fresh --seed
  ${cyan}artcc              ${reset}php artisan clear-compiled
  ${cyan}cdo                ${reset}composer dump-autoload -o
  ${cyan}cnoa               ${reset}composer install --optimize-autoloader --no-dev
  ${cyan}sail               ${reset}vendor/bin/sail
  ${cyan}session-flush      ${reset}rm -f storage/framework/sessions/*

${green}npm aliases
  ${cyan}nrd                ${reset}npm run dev
  ${cyan}nrp                ${reset}npm run prod
  ${cyan}nrw                ${reset}npm run watch

${green}vite aliases
  ${cyan}vb                ${reset}npm run build
  ${cyan}vp                ${reset}npm run preview

${green}wordpress aliases
  ${cyan}wp                ${reset}cd /c/laragon/www-wordpress/
  ${cyan}wpt               ${reset}cd web/app/themes/

${green}git aliases
  ${cyan}gac                ${reset}git add . && git commit -a -m
  ${cyan}wip                ${reset}git add . && git commit -m 'wip' && git push
  ${cyan}nah                ${reset}git reset --hard && git clean -df
  ${cyan}pusherok           ${reset}git push heroku heroku:main
  ${cyan}wiperok            ${reset}git add . && git commit -m 'wip heroku' && git push heroku heroku:main

${green}other aliases
  ${cyan}vue                ${reset}winpty vue.cmd
  ${cyan}botmanclr          ${reset}php artisan botman:cache:clear && php artisan cache:clear  && php artisan config:clear

${green}functions
  ${cyan}homestead()        ${reset}cd ~/Homestead && vagrant \$*
  ${cyan}art()              ${reset}php artisan "\$@"
  ${cyan}artroku()          ${reset}heroku run php artisan "\$@"
  ${cyan}laragon()          ${reset}cd /c/laragon/www/\$*
  ${cyan}reload()           ${reset}. ~/.bashrc
  ${cyan}npm_reset()        ${reset}resets npm installation on the project
"
}