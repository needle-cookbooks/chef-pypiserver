maintainer       "Cameron Johnston"
maintainer_email "cameron@rootdown.net"
license          "Apache 2.0"
description      "Installs/Configures pypiserver"

version          "0.2.0"

%w{git python runit}.each do |cb|
  depends cb
end
