module VagrantVars
    SERVER_NAME = "KMJ Standard Project" #name of the project
    HOST_NAME = "kmj.app" #url that will be used for accessing the machine
    IP_ADDRESS = "192.168.33.99" #IP address for the server. It is important that this does not conflict with the IP address range of your local network

    # Ansible vars below
    DATABASE_USER = "root" #user to use the database as
    DATABASE_PASSWORD = "password" #password for the database user
    DATABASE_NAME = "kmj" #database name
end
