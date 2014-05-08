Puppet::Parser::Functions.newfunction(:hashpasswd, :type=>:rvalue) do |args|
  rootpassword = args[0]
  osfamily = args[1]

  case osfamily
  when 'RedHat'
    hashcmd = "openssl passwd -1"
  when 'Debian'
    hashcmd = "mkpasswd -m sha-512"
  when 'Solaris'
    hashcmd = "openssl passwd"
  else
    fail "#{osfamily} not supported"
  end

  dohashcmd = "#{hashcmd} #{rootpassword}"
  hashedpwd = %x( #{dohashcmd} )
  hashedpwd.chomp
end
