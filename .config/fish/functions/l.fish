function l --wraps='eza -alFh --icons --git' --wraps='eza -alh --icons --git' --wraps='eza -alh --icons --git -F always' --wraps='eza -alh --icons -F always' --description 'alias l=eza -alh --icons -F always'
  eza -alh --icons -F always $argv
        
end
