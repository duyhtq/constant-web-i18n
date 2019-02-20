# export APP_NAME=$1 export CROWDIN_API=$2
hasChange=0
echo "If Submodule has any new update"
if [[ `git status --porcelain` ]]; then
  echo "Has some new update from frontend repo"
  #git add .
  #git commit -m "Pull newest version from frontend git repo"
  hasChange=1
else
  echo "No Change from frontend repo"
fi

echo "Going to download and get a newest translation"
yarn i18n-prepare

if [[ `git status --porcelain` ]]; then
  echo "Has new translation need to send to crowdin"
  #git add .
  #git commit -m "Commit for pushing to crowdin"
  hasChange=1
  yarn send
else
  echo "No thing new to push to crowdin"
fi

yarn download && yarn unparser

if [[ `git status --porcelain` ]]; then
  echo "Download from crowdin and has some new changes"
  #git add .
  #git commit -m "Update new version for translation"
  hasChange=1
else
  echo "No Change"
fi
# git push origin integrate/CI
if [ $hasChange == 1 ]
then
  echo "HAS CHANGE TO PUSH"
  # git push origin integrate/CI
  git remote set-url origin https://$1@github.com/constant-money/constant-web-i18n.git && git status && git add . && git commit -m "Travis Update"
  #&& git push origin integrate/CI
else
  echo "NOTHING TO PUSH"
fi
echo "Done"
