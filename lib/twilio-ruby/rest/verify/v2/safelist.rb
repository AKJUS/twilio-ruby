##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Verify
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Verify < VerifyBase
            class V2 < Version
                class SafelistList < ListResource
                
                    ##
                    # Initialize the SafelistList
                    # @param [Version] version Version that contains the resource
                    # @return [SafelistList] SafelistList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/SafeList/Numbers"
                        
                    end
                    ##
                    # Create the SafelistInstance
                    # @param [String] phone_number The phone number to be added in SafeList. Phone numbers must be in [E.164 format](https://www.twilio.com/docs/glossary/what-e164).
                    # @return [SafelistInstance] Created SafelistInstance
                    def create(
                        phone_number: nil
                    )

                        data = Twilio::Values.of({
                            'PhoneNumber' => phone_number,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        SafelistInstance.new(
                            @version,
                            payload,
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Verify.V2.SafelistList>'
                    end
                end


                class SafelistContext < InstanceContext
                    ##
                    # Initialize the SafelistContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] phone_number The phone number to be fetched from SafeList. Phone numbers must be in [E.164 format](https://www.twilio.com/docs/glossary/what-e164).
                    # @return [SafelistContext] SafelistContext
                    def initialize(version, phone_number)
                        super(version)

                        # Path Solution
                        @solution = { phone_number: phone_number,  }
                        @uri = "/SafeList/Numbers/#{@solution[:phone_number]}"

                        
                    end
                    ##
                    # Delete the SafelistInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the SafelistInstance
                    # @return [SafelistInstance] Fetched SafelistInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        SafelistInstance.new(
                            @version,
                            payload,
                            phone_number: @solution[:phone_number],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Verify.V2.SafelistContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Verify.V2.SafelistContext #{context}>"
                    end
                end

                class SafelistPage < Page
                    ##
                    # Initialize the SafelistPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SafelistPage] SafelistPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SafelistInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SafelistInstance] SafelistInstance
                    def get_instance(payload)
                        SafelistInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Verify.V2.SafelistPage>'
                    end
                end
                class SafelistInstance < InstanceResource
                    ##
                    # Initialize the SafelistInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Safelist
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SafelistInstance] SafelistInstance
                    def initialize(version, payload , phone_number: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'phone_number' => payload['phone_number'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'phone_number' => phone_number  || @properties['phone_number']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [SafelistContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = SafelistContext.new(@version , @params['phone_number'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the SafeList resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The phone number in SafeList.
                    def phone_number
                        @properties['phone_number']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the SafeList resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Delete the SafelistInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the SafelistInstance
                    # @return [SafelistInstance] Fetched SafelistInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Verify.V2.SafelistInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Verify.V2.SafelistInstance #{values}>"
                    end
                end

            end
        end
    end
end
