require 'active_support'
require 'active_support/core_ext'
require 'httparty'
require 'hubspot/exceptions'
require 'hubspot/resource'
require 'hubspot/collection'
require 'hubspot/paged_collection'
require 'hubspot/properties'
require 'hubspot/campaign'
require 'hubspot/company'
require 'hubspot/company_properties'
require 'hubspot/config'
require 'hubspot/connection'
require 'hubspot/contact'
require 'hubspot/contact_properties'
require 'hubspot/contact_list'
require 'hubspot/email_event'
require 'hubspot/form'
require 'hubspot/blog'
require 'hubspot/topic'
require 'hubspot/deal'
require 'hubspot/deal_pipeline'
require 'hubspot/deal_properties'
require 'hubspot/deprecator'
require 'hubspot/owner'
require 'hubspot/engagement'
require 'hubspot/subscription'
require 'hubspot/oauth'

module Hubspot
  def self.configure(config={})
    Hubspot::Config.configure(config)
  end

  require 'hubspot/railtie' if defined?(Rails)
end

# Alias the module for those looking to use the stylized name HubSpot
HubSpot = Hubspot
