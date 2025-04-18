##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Content
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Content < ContentBase
            class V1 < Version
                class ContentContext < InstanceContext

                     class ApprovalCreateList < ListResource
                
                    class ContentApprovalRequest
                            # @param [name]: [String] Name of the template.
                            # @param [category]: [String] A WhatsApp recognized template category.
                        attr_accessor :name, :category
                        def initialize(payload)
                                @name = payload["name"]
                                @category = payload["category"]
                        end
                        def to_json(options = {})
                        {
                                "name": @name,
                                "category": @category,
                        }.to_json(options)
                        end
                    end


                    ##
                    # Initialize the ApprovalCreateList
                    # @param [Version] version Version that contains the resource
                    # @return [ApprovalCreateList] ApprovalCreateList
                    def initialize(version, content_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { content_sid: content_sid }
                        @uri = "/Content/#{@solution[:content_sid]}/ApprovalRequests/whatsapp"
                        
                    end
                    ##
                    # Create the ApprovalCreateInstance
                    # @param [ContentApprovalRequest] content_approval_request 
                    # @return [ApprovalCreateInstance] Created ApprovalCreateInstance
                    def create(content_approval_request: nil
                    )

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        headers['Content-Type'] = 'application/json'
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, headers: headers, data: content_approval_request.to_json)
                        ApprovalCreateInstance.new(
                            @version,
                            payload,
                            content_sid: @solution[:content_sid],
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Content.V1.ApprovalCreateList>'
                    end
                end

                class ApprovalCreatePage < Page
                    ##
                    # Initialize the ApprovalCreatePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ApprovalCreatePage] ApprovalCreatePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ApprovalCreateInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ApprovalCreateInstance] ApprovalCreateInstance
                    def get_instance(payload)
                        ApprovalCreateInstance.new(@version, payload, content_sid: @solution[:content_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Content.V1.ApprovalCreatePage>'
                    end
                end
                class ApprovalCreateInstance < InstanceResource
                    ##
                    # Initialize the ApprovalCreateInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this ApprovalCreate
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ApprovalCreateInstance] ApprovalCreateInstance
                    def initialize(version, payload , content_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'name' => payload['name'],
                            'category' => payload['category'],
                            'content_type' => payload['content_type'],
                            'status' => payload['status'],
                            'rejection_reason' => payload['rejection_reason'],
                            'allow_category_change' => payload['allow_category_change'],
                        }
                    end

                    
                    ##
                    # @return [String] 
                    def name
                        @properties['name']
                    end
                    
                    ##
                    # @return [String] 
                    def category
                        @properties['category']
                    end
                    
                    ##
                    # @return [String] 
                    def content_type
                        @properties['content_type']
                    end
                    
                    ##
                    # @return [String] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] 
                    def rejection_reason
                        @properties['rejection_reason']
                    end
                    
                    ##
                    # @return [Boolean] 
                    def allow_category_change
                        @properties['allow_category_change']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Content.V1.ApprovalCreateInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Content.V1.ApprovalCreateInstance>"
                    end
                end

             end
            end
        end
    end
end


