##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Routes
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Routes < RoutesBase
            class V2 < Version
                class SipDomainList < ListResource
                
                    ##
                    # Initialize the SipDomainList
                    # @param [Version] version Version that contains the resource
                    # @return [SipDomainList] SipDomainList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Routes.V2.SipDomainList>'
                    end
                end


                class SipDomainContext < InstanceContext
                    ##
                    # Initialize the SipDomainContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sip_domain 
                    # @return [SipDomainContext] SipDomainContext
                    def initialize(version, sip_domain)
                        super(version)

                        # Path Solution
                        @solution = { sip_domain: sip_domain,  }
                        @uri = "/SipDomains/#{@solution[:sip_domain]}"

                        
                    end
                    ##
                    # Fetch the SipDomainInstance
                    # @return [SipDomainInstance] Fetched SipDomainInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        SipDomainInstance.new(
                            @version,
                            payload,
                            sip_domain: @solution[:sip_domain],
                        )
                    end

                    ##
                    # Update the SipDomainInstance
                    # @param [String] voice_region 
                    # @param [String] friendly_name 
                    # @return [SipDomainInstance] Updated SipDomainInstance
                    def update(
                        voice_region: :unset, 
                        friendly_name: :unset
                    )

                        data = Twilio::Values.of({
                            'VoiceRegion' => voice_region,
                            'FriendlyName' => friendly_name,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        SipDomainInstance.new(
                            @version,
                            payload,
                            sip_domain: @solution[:sip_domain],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Routes.V2.SipDomainContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Routes.V2.SipDomainContext #{context}>"
                    end
                end

                class SipDomainPage < Page
                    ##
                    # Initialize the SipDomainPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SipDomainPage] SipDomainPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SipDomainInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SipDomainInstance] SipDomainInstance
                    def get_instance(payload)
                        SipDomainInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Routes.V2.SipDomainPage>'
                    end
                end
                class SipDomainInstance < InstanceResource
                    ##
                    # Initialize the SipDomainInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this SipDomain
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SipDomainInstance] SipDomainInstance
                    def initialize(version, payload , sip_domain: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sip_domain' => payload['sip_domain'],
                            'url' => payload['url'],
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'friendly_name' => payload['friendly_name'],
                            'voice_region' => payload['voice_region'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sip_domain' => sip_domain  || @properties['sip_domain']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [SipDomainContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = SipDomainContext.new(@version , @params['sip_domain'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] 
                    def sip_domain
                        @properties['sip_domain']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] 
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] 
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] 
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] 
                    def voice_region
                        @properties['voice_region']
                    end
                    
                    ##
                    # @return [Time] 
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] 
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # Fetch the SipDomainInstance
                    # @return [SipDomainInstance] Fetched SipDomainInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the SipDomainInstance
                    # @param [String] voice_region 
                    # @param [String] friendly_name 
                    # @return [SipDomainInstance] Updated SipDomainInstance
                    def update(
                        voice_region: :unset, 
                        friendly_name: :unset
                    )

                        context.update(
                            voice_region: voice_region, 
                            friendly_name: friendly_name, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Routes.V2.SipDomainInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Routes.V2.SipDomainInstance #{values}>"
                    end
                end

            end
        end
    end
end
