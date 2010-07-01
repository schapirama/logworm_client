logworm client gem
------------------

Rails Usage
-----------

Edit environment.rb and add

<pre><code>config.gem 'logworm_client'</pre></code>
    
inside the <code>Rails::Initializer.run</code> block

See http://www.logworm.com/docs/setup

Rack Usage
----------

<p>Edit your config.ru file and indicate that you want to use logworm's Rack middleware. For example, for a Sinatra application you'd have:</p>

<code><pre>require "myapp"
require "logworm_client"
use Logworm::Rack
run Sinatra::Application
</pre></code>

See http://www.logworm.com/docs/setup

Configuration Options
---------------------

See http://www.logworm.com/docs/config

Command-Line tools
------------------

lw-tail
-------

See http://www.logworm.com/docs/tail

lw-compute
----------

See http://www.logworm.com/docs/compute

