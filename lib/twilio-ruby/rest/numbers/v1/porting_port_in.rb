##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Numbers
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Numbers < NumbersBase
            class V1 < Version
                class PortingPortInList < ListResource
                
                    ##
                    # Initialize the PortingPortInList
                    # @param [Version] version Version that contains the resource
                    # @return [PortingPortInList] PortingPortInList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Porting/PortIn"
                        
                    end
                    ##
                    # Create the PortingPortInInstance
                    # @param [Object] body 
                    # @return [PortingPortInInstance] Created PortingPortInInstance
                    def create(body: :unset
                    )

                        headers = Twilio::Values.of({"Content-Type"=> "application/json"})
                        payload = @version.create('POST', @uri, data: body.to_json, headers: headers)
                        PortingPortInInstance.new(
                            @version,
                            payload,
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Numbers.V1.PortingPortInList>'
                    end
                end


                class PortingPortInContext < InstanceContext
                    ##
                    # Initialize the PortingPortInContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] port_in_request_sid The SID of the Port In request. This is a unique identifier of the port in request.
                    # @return [PortingPortInContext] PortingPortInContext
                    def initialize(version, port_in_request_sid)
                        super(version)

                        # Path Solution
                        @solution = { port_in_request_sid: port_in_request_sid,  }
                        @uri = "/Porting/PortIn/#{@solution[:port_in_request_sid]}"

                        
                    end
                    ##
                    # Delete the PortingPortInInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        
                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the PortingPortInInstance
                    # @return [PortingPortInInstance] Fetched PortingPortInInstance
                    def fetch

                        
                        payload = @version.fetch('GET', @uri)
                        PortingPortInInstance.new(
                            @version,
                            payload,
                            port_in_request_sid: @solution[:port_in_request_sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Numbers.V1.PortingPortInContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Numbers.V1.PortingPortInContext #{context}>"
                    end
                end

                class PortingPortInPage < Page
                    ##
                    # Initialize the PortingPortInPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [PortingPortInPage] PortingPortInPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of PortingPortInInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [PortingPortInInstance] PortingPortInInstance
                    def get_instance(payload)
                        PortingPortInInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Numbers.V1.PortingPortInPage>'
                    end
                end
                class PortingPortInInstance < InstanceResource
                    ##
                    # Initialize the PortingPortInInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this PortingPortIn
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [PortingPortInInstance] PortingPortInInstance
                    def initialize(version, payload , port_in_request_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'port_in_request_sid' => payload['port_in_request_sid'],
                            'url' => payload['url'],
                            'account_sid' => payload['account_sid'],
                            'notification_emails' => payload['notification_emails'],
                            'target_port_in_date' => Twilio.deserialize_iso8601_date(payload['target_port_in_date']),
                            'target_port_in_time_range_start' => payload['target_port_in_time_range_start'],
                            'target_port_in_time_range_end' => payload['target_port_in_time_range_end'],
                            'port_in_request_status' => payload['port_in_request_status'],
                            'losing_carrier_information' => payload['losing_carrier_information'],
                            'phone_numbers' => payload['phone_numbers'],
                            'documents' => payload['documents'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'port_in_request_sid' => port_in_request_sid  || @properties['port_in_request_sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [PortingPortInContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = PortingPortInContext.new(@version , @params['port_in_request_sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the Port In request. This is a unique identifier of the port in request.
                    def port_in_request_sid
                        @properties['port_in_request_sid']
                    end
                    
                    ##
                    # @return [String] The URL of this Port In request
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] The Account SID that the numbers will be added to after they are ported into Twilio.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [Array<String>] List of emails for getting notifications about the LOA signing process. Allowed Max 10 emails.
                    def notification_emails
                        @properties['notification_emails']
                    end
                    
                    ##
                    # @return [Date] Minimum number of days in the future (at least 2 days) needs to be established with the Ops team for validation.
                    def target_port_in_date
                        @properties['target_port_in_date']
                    end
                    
                    ##
                    # @return [String] Minimum hour in the future needs to be established with the Ops team for validation.
                    def target_port_in_time_range_start
                        @properties['target_port_in_time_range_start']
                    end
                    
                    ##
                    # @return [String] Maximum hour in the future needs to be established with the Ops team for validation.
                    def target_port_in_time_range_end
                        @properties['target_port_in_time_range_end']
                    end
                    
                    ##
                    # @return [String] The status of the port in request. The possible values are: In progress, Completed, Expired, In review, Waiting for Signature, Action Required, and Canceled.
                    def port_in_request_status
                        @properties['port_in_request_status']
                    end
                    
                    ##
                    # @return [Hash] The information for the losing carrier. 
                    def losing_carrier_information
                        @properties['losing_carrier_information']
                    end
                    
                    ##
                    # @return [Array<Hash>] The list of phone numbers to Port in. Phone numbers are in E.164 format (e.g. +16175551212).
                    def phone_numbers
                        @properties['phone_numbers']
                    end
                    
                    ##
                    # @return [Array<String>] The list of documents SID referencing a utility bills
                    def documents
                        @properties['documents']
                    end
                    
                    ##
                    # Delete the PortingPortInInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the PortingPortInInstance
                    # @return [PortingPortInInstance] Fetched PortingPortInInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Numbers.V1.PortingPortInInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Numbers.V1.PortingPortInInstance #{values}>"
                    end
                end

            end
        end
    end
end
