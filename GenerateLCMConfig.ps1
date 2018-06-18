####This configures the LCMConfig
##
configuration LCMConfig {
#parameters
    param([string[]]$computername = "localhost")
#Target Node
    node $computername {
    #LCM Resource
    Localconfigurationmanager {
        ConfigurationMode = "ApplyAndAutoCorrect"
        ConfigurationModeFrequencyMins = 30
        }
       }
      }

      # Generate mof file
      LCMConfig -computername localhost

      #Check LCM Settings on targe node
      Get-DscLocalConfigurationManager -CimSession localhost

      #Apply the LCMConfig for each targe node
      Set-DscLocalConfigurationManager -path LCMConfig

      #Check the LCM Config again
      Get-DscLocalConfigurationManager -CimSession localhost