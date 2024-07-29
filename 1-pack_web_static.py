
from fabri.api  import local
from datetime import datetime 

@task 

def do_pack():

    """generaates a .tgz archive from  the contents of the web_static folder"""

    try:

        # get the current time in specified format 

        time = datetime.utcnow().strftime('%Y%m%d%H%M%S')


        #create the file name for the archive 
        file_name = "versions/web_static_{}.tgz".format(time)

        #create the version folder folder if it doesnt exist 
        local("mkdir -p ./versions")


        #create  the archive using tar 
        local("tar --create --verbose -z --file={} ./web_static".format(file_name))
        
        return file_name
    except:
        return None
