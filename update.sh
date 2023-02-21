#/bin/bash!

echo -e "[\e[92m#\e[0m] Update submodules from remote repository"
git submodule update --remote
echo -e "[\e[92m#\e[0m] Done"
