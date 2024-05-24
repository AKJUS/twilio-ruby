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
                class ServiceContext < InstanceContext

                     class VerificationCheckList < ListResource
                
                    ##
                    # Initialize the VerificationCheckList
                    # @param [Version] version Version that contains the resource
                    # @return [VerificationCheckList] VerificationCheckList
                    def initialize(version, service_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/VerificationCheck"
                        
                    end
                    ##
                    # Create the VerificationCheckInstance
                    # @param [String] code The 4-10 character string being verified.
                    # @param [String] to The phone number or [email](https://www.twilio.com/docs/verify/email) to verify. Either this parameter or the `verification_sid` must be specified. Phone numbers must be in [E.164 format](https://www.twilio.com/docs/glossary/what-e164).
                    # @param [String] verification_sid A SID that uniquely identifies the Verification Check. Either this parameter or the `to` phone number/[email](https://www.twilio.com/docs/verify/email) must be specified.
                    # @param [String] amount The amount of the associated PSD2 compliant transaction. Requires the PSD2 Service flag enabled.
                    # @param [String] payee The payee of the associated PSD2 compliant transaction. Requires the PSD2 Service flag enabled.
                    # @return [VerificationCheckInstance] Created VerificationCheckInstance
                    def create(
                        code: :unset, 
                        to: :unset, 
                        verification_sid: :unset, 
                        amount: :unset, 
                        payee: :unset
                    )

                        data = Twilio::Values.of({
                            'Code' => code,
                            'To' => to,
                            'VerificationSid' => verification_sid,
                            'Amount' => amount,
                            'Payee' => payee,
                        })

                        
                        payload = @version.create('POST', @uri, data: data)
                        VerificationCheckInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Verify.V2.VerificationCheckList>'
                    end
                end

                class VerificationCheckPage < Page
                    ##
                    # Initialize the VerificationCheckPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [VerificationCheckPage] VerificationCheckPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of VerificationCheckInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [VerificationCheckInstance] VerificationCheckInstance
                    def get_instance(payload)
                        VerificationCheckInstance.new(@version, payload, service_sid: @solution[:service_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Verify.V2.VerificationCheckPage>'
                    end
                end
                class VerificationCheckInstance < InstanceResource
                    ##
                    # Initialize the VerificationCheckInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this VerificationCheck
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [VerificationCheckInstance] VerificationCheckInstance
                    def initialize(version, payload , service_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'service_sid' => payload['service_sid'],
                            'account_sid' => payload['account_sid'],
                            'to' => payload['to'],
                            'channel' => payload['channel'],
                            'status' => payload['status'],
                            'valid' => payload['valid'],
                            'amount' => payload['amount'],
                            'payee' => payload['payee'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'sna_attempts_error_codes' => payload['sna_attempts_error_codes'],
                        }
                    end

                    
                    ##
                    # @return [String] The unique string that we created to identify the VerificationCheck resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Service](https://www.twilio.com/docs/verify/api/service) the resource is associated with.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the VerificationCheck resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The phone number or [email](https://www.twilio.com/docs/verify/email) being verified. Phone numbers must be in [E.164 format](https://www.twilio.com/docs/glossary/what-e164).
                    def to
                        @properties['to']
                    end
                    
                    ##
                    # @return [Channel] 
                    def channel
                        @properties['channel']
                    end
                    
                    ##
                    # @return [String] The status of the verification. Can be: `pending`, `approved`, `canceled`, `max_attempts_reached`, `deleted`, `failed` or `expired`.
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [Boolean] Use \"status\" instead. Legacy property indicating whether the verification was successful.
                    def valid
                        @properties['valid']
                    end
                    
                    ##
                    # @return [String] The amount of the associated PSD2 compliant transaction. Requires the PSD2 Service flag enabled.
                    def amount
                        @properties['amount']
                    end
                    
                    ##
                    # @return [String] The payee of the associated PSD2 compliant transaction. Requires the PSD2 Service flag enabled.
                    def payee
                        @properties['payee']
                    end
                    
                    ##
                    # @return [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the Verification Check resource was created.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the Verification Check resource was last updated.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [Array<Hash>] List of error codes as a result of attempting a verification using the `sna` channel. The error codes are chronologically ordered, from the first attempt to the latest attempt. This will be an empty list if no errors occured or `null` if the last channel used wasn't `sna`.
                    def sna_attempts_error_codes
                        @properties['sna_attempts_error_codes']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Verify.V2.VerificationCheckInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Verify.V2.VerificationCheckInstance>"
                    end
                end

             end
            end
        end
    end
end


