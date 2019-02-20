echo "If Submodule has any new update"
if [[ `git status --porcelain` ]]; then
  echo "Has some new update from frontend repo"
  git add .
  git commit -m "Pull newest version from frontend git repo"
else
  echo "No Change from frontend repo"
echo "Going to download and get a newest translation"
export APP_NAME=$1 export CROWDIN_API=$2 yarn i18n-prepare
if [[ `git status --porcelain` ]]; then
  echo "Has new translation need to send to crowdin"
  git add .
  git commit -m "Commit for pushing to crowdin"
  export APP_NAME=$1 export CROWDIN_API=$2 yarn send
else
  echo "No thing new to push to crowdin"
export APP_NAME=$1 export CROWDIN_API=$2 yarn download & yarn unparser
if [[ `git status --porcelain` ]]; then
  echo "Download from crowdin and has some new changes"
  git add .
  git commit -m "Update new version for translation"
else
  echo "No Change"
git push origin integrate/CI
echo "Done"