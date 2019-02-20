# export APP_NAME=$1 export CROWDIN_API=$2
hasChange=$false
echo "If Submodule has any new update"
if [[ `git status --porcelain` ]]; then
  echo "Has some new update from frontend repo"
  git add .
  git commit -m "Pull newest version from frontend git repo"
  hasChange=$true
else
  echo "No Change from frontend repo"
fi

echo "Going to download and get a newest translation"
yarn i18n-prepare

if [[ `git status --porcelain` ]]; then
  echo "Has new translation need to send to crowdin"
  git add .
  git commit -m "Commit for pushing to crowdin"
  hasChange=$true
  yarn send
else
  echo "No thing new to push to crowdin"
fi

yarn download && yarn unparser

if [[ `git status --porcelain` ]]; then
  echo "Download from crowdin and has some new changes"
  git add .
  git commit -m "Update new version for translation"
  hasChange=$true
else
  echo "No Change"
fi
# git push origin integrate/CI
if [ $hasChange ]
then
  echo "HAS CHANGE TO PUSH"
else
  echo "NOTHING TO PUSH"
fi
echo "Done"
