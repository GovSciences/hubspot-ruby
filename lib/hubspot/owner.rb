module Hubspot
  #
  # HubSpot Owners API
  #
  # {http://developers.hubspot.com/docs/methods/owners/get_owners}
  #
  # TODO: Create an Owner
  # TODO: Update an Owner
  # TODO: Delete an Owner
  class Owner
    GET_OWNER_PATH    = '/crm/v3/owners/:owner_id' # GET
    GET_OWNERS_PATH   = '/crm/v3/owners' # GET


    attr_reader :properties, :owner_id, :email

    def initialize(property_hash)
      @properties = property_hash
      @owner_id   = @properties['ownerId']
      @email      = @properties['email']
    end

    def [](property)
      @properties[property]
    end

    class << self
      def all(include_inactive=false)
        path     = GET_OWNERS_PATH
        params   = { includeInactive: include_inactive }
        response = Hubspot::Connection.get_json(path, params)
        response.map { |r| new(r) }
      end

      def find(id, include_inactive=false)
        path     = GET_OWNER_PATH
        response = Hubspot::Connection.get_json(path, owner_id: id,
                                                archived: include_inactive)
        new(response)
      end

      def find_by_email(email, include_inactive=false)
        path     = GET_OWNERS_PATH
        params   = { email: email, archived: include_inactive }
        response = Hubspot::Connection.get_json(path, params)
        response.blank? ? nil : new(response.first)
      end

      def find_by_emails(emails, include_inactive=false)
        emails.map { |email| find_by_email(email, include_inactive) }.reject(&:blank?)
      end
    end
  end
end
