{% import "base.tpl" as tools with context %}

<VirtualHost *:80>
    {{ tools.defaultConfig(doc_root, servername) }}
    {% if enviroment == "dev" or enviroment == "test" %}
    {{ tools.phpmyadmin() }}
    {% endif %}
</VirtualHost>
        
<VirtualHost *:443>
    {{ tools.defaultConfig(doc_root, servername) }}
    {% if enviroment == "dev" or enviroment == "test" %}
    {{ tools.phpmyadmin() }}
    {% endif %}
    {{ tools.ssl(servername) }}
</VirtualHost>
        
        

