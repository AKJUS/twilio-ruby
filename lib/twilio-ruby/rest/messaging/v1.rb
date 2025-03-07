##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Messaging
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#

module Twilio
    module REST
        class Messaging
            class V1 < Version
                ##
                # Initialize the V1 version of Messaging
                def initialize(domain)
                    super
                    @version = 'v1'
                    @brand_registrations = nil
                    @deactivations = nil
                    @domain_certs = nil
                    @domain_config = nil
                    @domain_config_messaging_service = nil
                    @external_campaign = nil
                    @linkshortening_messaging_service = nil
                    @linkshortening_messaging_service_domain_association = nil
                    @request_managed_cert = nil
                    @services = nil
                    @tollfree_verifications = nil
                    @usecases = nil
                end

                ##
                # @param [String] sid The SID of the Brand Registration resource to fetch.
                # @return [Twilio::REST::Messaging::V1::BrandRegistrationContext] if sid was passed.
                # @return [Twilio::REST::Messaging::V1::BrandRegistrationList]
                def brand_registrations(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @brand_registrations ||= BrandRegistrationList.new self
                    else
                        BrandRegistrationContext.new(self, sid)
                    end
                end
                ##
                # @return [Twilio::REST::Messaging::V1::deactivationsContext]
                def deactivations
                    @deactivations ||= DeactivationsContext.new self
                end
                ##
                # @param [String] domain_sid Unique string used to identify the domain that this certificate should be associated with.
                # @return [Twilio::REST::Messaging::V1::DomainCertsContext] if domainSid was passed.
                # @return [Twilio::REST::Messaging::V1::DomainCertsList]
                def domain_certs(domain_sid=:unset)
                    if domain_sid.nil?
                        raise ArgumentError, 'domain_sid cannot be nil'
                    end
                    if domain_sid == :unset
                        @domain_certs ||= DomainCertsList.new self
                    else
                        DomainCertsContext.new(self, domain_sid)
                    end
                end
                ##
                # @param [String] domain_sid Unique string used to identify the domain that this config should be associated with.
                # @return [Twilio::REST::Messaging::V1::DomainConfigContext] if domainSid was passed.
                # @return [Twilio::REST::Messaging::V1::DomainConfigList]
                def domain_config(domain_sid=:unset)
                    if domain_sid.nil?
                        raise ArgumentError, 'domain_sid cannot be nil'
                    end
                    if domain_sid == :unset
                        @domain_config ||= DomainConfigList.new self
                    else
                        DomainConfigContext.new(self, domain_sid)
                    end
                end
                ##
                # @param [String] messaging_service_sid Unique string used to identify the Messaging service that this domain should be associated with.
                # @return [Twilio::REST::Messaging::V1::DomainConfigMessagingServiceContext] if messagingServiceSid was passed.
                # @return [Twilio::REST::Messaging::V1::DomainConfigMessagingServiceList]
                def domain_config_messaging_service(messaging_service_sid=:unset)
                    if messaging_service_sid.nil?
                        raise ArgumentError, 'messaging_service_sid cannot be nil'
                    end
                    if messaging_service_sid == :unset
                        @domain_config_messaging_service ||= DomainConfigMessagingServiceList.new self
                    else
                        DomainConfigMessagingServiceContext.new(self, messaging_service_sid)
                    end
                end
                ##
                # @return [Twilio::REST::Messaging::V1::ExternalCampaignList]
                def external_campaign
                    @external_campaign ||= ExternalCampaignList.new self
                end
                ##
                # @param [String] domain_sid The domain SID to associate with a messaging service. With URL shortening enabled, links in messages sent with the associated messaging service will be shortened to the provided domain
                # @param [String] messaging_service_sid A messaging service SID to associate with a domain. With URL shortening enabled, links in messages sent with the provided messaging service will be shortened to the associated domain
                # @return [Twilio::REST::Messaging::V1::LinkshorteningMessagingServiceContext] if domainSid was passed.
                # @return [Twilio::REST::Messaging::V1::LinkshorteningMessagingServiceList]
                def linkshortening_messaging_service(domain_sid=:unset, messaging_service_sid=:unset)
                    if domain_sid.nil?
                        raise ArgumentError, 'domain_sid cannot be nil'
                    end
                    if messaging_service_sid.nil?
                        raise ArgumentError, 'messaging_service_sid cannot be nil'
                    end
                    if domain_sid == :unset && messaging_service_sid == :unset
                        @linkshortening_messaging_service ||= LinkshorteningMessagingServiceList.new self
                    else
                        LinkshorteningMessagingServiceContext.new(self, domain_sid, messaging_service_sid)
                    end
                end
                ##
                # @param [String] domain_sid The domain SID to associate with a messaging service. With URL shortening enabled, links in messages sent with the associated messaging service will be shortened to the provided domain
                # @param [String] messaging_service_sid A messaging service SID to associate with a domain. With URL shortening enabled, links in messages sent with the provided messaging service will be shortened to the associated domain
                # @return [Twilio::REST::Messaging::V1::LinkshorteningMessagingServiceContext] if messagingServiceSid was passed.
                # @return [Twilio::REST::Messaging::V1::LinkshorteningMessagingServiceList]
                def linkshortening_messaging_service(domain_sid=:unset, messaging_service_sid=:unset)
                    if domain_sid.nil?
                        raise ArgumentError, 'domain_sid cannot be nil'
                    end
                    if messaging_service_sid.nil?
                        raise ArgumentError, 'messaging_service_sid cannot be nil'
                    end
                    if domain_sid == :unset && messaging_service_sid == :unset
                        @linkshortening_messaging_service ||= LinkshorteningMessagingServiceList.new self
                    else
                        LinkshorteningMessagingServiceContext.new(self, domain_sid, messaging_service_sid)
                    end
                end
                ##
                # @param [String] messaging_service_sid Unique string used to identify the Messaging service that this domain should be associated with.
                # @return [Twilio::REST::Messaging::V1::LinkshorteningMessagingServiceDomainAssociationContext] if messagingServiceSid was passed.
                # @return [Twilio::REST::Messaging::V1::LinkshorteningMessagingServiceDomainAssociationList]
                def linkshortening_messaging_service_domain_association(messaging_service_sid=:unset)
                    if messaging_service_sid.nil?
                        raise ArgumentError, 'messaging_service_sid cannot be nil'
                    end
                    if messaging_service_sid == :unset
                        @linkshortening_messaging_service_domain_association ||= LinkshorteningMessagingServiceDomainAssociationList.new self
                    else
                        LinkshorteningMessagingServiceDomainAssociationContext.new(self, messaging_service_sid)
                    end
                end
                ##
                # @param [String] domain_sid Unique string used to identify the domain that this certificate should be associated with.
                # @return [Twilio::REST::Messaging::V1::RequestManagedCertContext] if domainSid was passed.
                # @return [Twilio::REST::Messaging::V1::RequestManagedCertList]
                def request_managed_cert(domain_sid=:unset)
                    if domain_sid.nil?
                        raise ArgumentError, 'domain_sid cannot be nil'
                    end
                    if domain_sid == :unset
                        @request_managed_cert ||= RequestManagedCertList.new self
                    else
                        RequestManagedCertContext.new(self, domain_sid)
                    end
                end
                ##
                # @param [String] sid The SID of the Service resource to fetch.
                # @return [Twilio::REST::Messaging::V1::ServiceContext] if sid was passed.
                # @return [Twilio::REST::Messaging::V1::ServiceList]
                def services(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @services ||= ServiceList.new self
                    else
                        ServiceContext.new(self, sid)
                    end
                end
                ##
                # @param [String] sid A unique string identifying a Tollfree Verification.
                # @return [Twilio::REST::Messaging::V1::TollfreeVerificationContext] if sid was passed.
                # @return [Twilio::REST::Messaging::V1::TollfreeVerificationList]
                def tollfree_verifications(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @tollfree_verifications ||= TollfreeVerificationList.new self
                    else
                        TollfreeVerificationContext.new(self, sid)
                    end
                end
                ##
                # @return [Twilio::REST::Messaging::V1::UsecaseList]
                def usecases
                    @usecases ||= UsecaseList.new self
                end
                ##
                # Provide a user friendly representation
                def to_s
                    '<Twilio::REST::Messaging::V1>';
                end
            end
        end
    end
end
