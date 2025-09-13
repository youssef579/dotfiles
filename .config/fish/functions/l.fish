function l --wraps='ls -al' --wraps='ls -alF' --wraps='ls -alFh' --description 'alias l=ls -alFh'
  ls -alFh $argv
        
end
