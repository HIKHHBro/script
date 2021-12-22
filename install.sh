. base.sh
_task  sed -i '/^script_dir=/d' hikrun.sh
_task sed -i "1iscript_dir=\"`pwd`\"" hikrun.sh

_task sed -i '/^script_dir=/d' base.sh
_task sed -i "1iscript_dir=\"`pwd`\"" base.sh

_task sed -i '/^script_dir=/d' hik_run_complete.sh 
_task sed -i "1iscript_dir=\"`pwd`\"" hik_run_complete.sh 

echo "source `pwd`/hik_run_complete.sh" >> ~/.bashrc
_task source ~/.bashrc

echo ". `pwd`/hikrun.sh \$*" >  hikrun
_task sudo mv hikrun /usr/local/bin/hikrun
_task sudo chmod 755 /usr/local/bin/hikrun

if [ ! -d company/ ];then
_task mkdir company
_task  touch company/companybase.sh
_task  touch company/companyfunc.sh
fi


