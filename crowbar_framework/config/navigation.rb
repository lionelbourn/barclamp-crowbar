SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :nodes, t('nav.nodes'), root_path do |secondary|
      secondary.item :dashboard, t('nav.dashboard'), dashboard_path()
      secondary.item :bulkedit, t('nav.list'), nodes_list_path(:allocated=>'yes') 
      # insert here for :nodes
    end
    if RAILS_ENV == 'development'
      primary.item :network, t('nav.network'), network_path do |secondary| 
        secondary.item :network, t('nav.switches'), network_path 
        # insert here for :network
      end
    end
    primary.item :barclamps, t('nav.barclamps'), barclamp_modules_path do |secondary|
      secondary.item :barclamps, t('nav.all_bc'), barclamp_modules_path
      secondary.item :crowbar, t('nav.crowbar_bc'), index_barclamp_path(:controller=>'crowbar')
      # insert here for :barclamps 
      # insert here for :add  (this is legacy support)
    end
    primary.item :help, t('nav.help'), '/crowbar_users_guide.pdf', { :link => { :target => "_blank" } } do |secondary|
      secondary.item :help, t('nav.crowbar_wiki'), 'https://github.com/dellcloudedge/crowbar/wiki/', { :link => { :target => "_blank" } }
      secondary.item :help, t('nav.crowbar_ug'), '/crowbar_users_guide.pdf', { :link => { :target => "_blank" } }
      secondary.item :help, t('nav.crowbar_dg'), '/crowbar_deployment_guide.pdf', { :link => { :target => "_blank" } }
      # insert here for :help 
    end
  end
end