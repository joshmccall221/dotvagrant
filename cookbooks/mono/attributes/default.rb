default['mono']['install_method'] = "packages"

case platform
when "debian","ubuntu"
  default['mono']['prefix']	=	"/usr/local"
  default['mono']['branch']	=	"mono-3.0.12"
end
