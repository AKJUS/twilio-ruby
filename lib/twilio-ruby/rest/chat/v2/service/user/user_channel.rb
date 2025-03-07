##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Chat
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Chat < ChatBase
            class V2 < Version
                class ServiceContext < InstanceContext
                class UserContext < InstanceContext

                     class UserChannelList < ListResource
                
                    ##
                    # Initialize the UserChannelList
                    # @param [Version] version Version that contains the resource
                    # @return [UserChannelList] UserChannelList
                    def initialize(version, service_sid: nil, user_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid, user_sid: user_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/Users/#{@solution[:user_sid]}/Channels"
                        
                    end
                
                    ##
                    # Lists UserChannelInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(limit: nil, page_size: nil)
                        self.stream(
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields UserChannelInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of UserChannelInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of UserChannelInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        UserChannelPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of UserChannelInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of UserChannelInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    UserChannelPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Chat.V2.UserChannelList>'
                    end
                end


                class UserChannelContext < InstanceContext
                    ##
                    # Initialize the UserChannelContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) to update the User Channel resource in.
                    # @param [String] user_sid The SID of the [User](https://www.twilio.com/docs/chat/rest/user-resource) to update the User Channel resource from. This value can be either the `sid` or the `identity` of the User resource.
                    # @param [String] channel_sid The SID of the [Channel](https://www.twilio.com/docs/chat/channels) with the User Channel resource to update. This value can be the Channel resource's `sid` or `unique_name`.
                    # @return [UserChannelContext] UserChannelContext
                    def initialize(version, service_sid, user_sid, channel_sid)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, user_sid: user_sid, channel_sid: channel_sid,  }
                        @uri = "/Services/#{@solution[:service_sid]}/Users/#{@solution[:user_sid]}/Channels/#{@solution[:channel_sid]}"

                        
                    end
                    ##
                    # Delete the UserChannelInstance
                    # @param [UserChannelEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        x_twilio_webhook_enabled: :unset
                    )

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the UserChannelInstance
                    # @return [UserChannelInstance] Fetched UserChannelInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        UserChannelInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            user_sid: @solution[:user_sid],
                            channel_sid: @solution[:channel_sid],
                        )
                    end

                    ##
                    # Update the UserChannelInstance
                    # @param [NotificationLevel] notification_level 
                    # @param [String] last_consumed_message_index The index of the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) in the [Channel](https://www.twilio.com/docs/chat/channels) that the Member has read.
                    # @param [Time] last_consumption_timestamp The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp of the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) read event for the Member within the [Channel](https://www.twilio.com/docs/chat/channels).
                    # @return [UserChannelInstance] Updated UserChannelInstance
                    def update(
                        notification_level: :unset, 
                        last_consumed_message_index: :unset, 
                        last_consumption_timestamp: :unset
                    )

                        data = Twilio::Values.of({
                            'NotificationLevel' => notification_level,
                            'LastConsumedMessageIndex' => last_consumed_message_index,
                            'LastConsumptionTimestamp' => Twilio.serialize_iso8601_datetime(last_consumption_timestamp),
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        UserChannelInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            user_sid: @solution[:user_sid],
                            channel_sid: @solution[:channel_sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Chat.V2.UserChannelContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Chat.V2.UserChannelContext #{context}>"
                    end
                end

                class UserChannelPage < Page
                    ##
                    # Initialize the UserChannelPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [UserChannelPage] UserChannelPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of UserChannelInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [UserChannelInstance] UserChannelInstance
                    def get_instance(payload)
                        UserChannelInstance.new(@version, payload, service_sid: @solution[:service_sid], user_sid: @solution[:user_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Chat.V2.UserChannelPage>'
                    end
                end
                class UserChannelInstance < InstanceResource
                    ##
                    # Initialize the UserChannelInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this UserChannel
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [UserChannelInstance] UserChannelInstance
                    def initialize(version, payload , service_sid: nil, user_sid: nil, channel_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'service_sid' => payload['service_sid'],
                            'channel_sid' => payload['channel_sid'],
                            'user_sid' => payload['user_sid'],
                            'member_sid' => payload['member_sid'],
                            'status' => payload['status'],
                            'last_consumed_message_index' => payload['last_consumed_message_index'] == nil ? payload['last_consumed_message_index'] : payload['last_consumed_message_index'].to_i,
                            'unread_messages_count' => payload['unread_messages_count'] == nil ? payload['unread_messages_count'] : payload['unread_messages_count'].to_i,
                            'links' => payload['links'],
                            'url' => payload['url'],
                            'notification_level' => payload['notification_level'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'user_sid' => user_sid  || @properties['user_sid']  ,'channel_sid' => channel_sid  || @properties['channel_sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [UserChannelContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = UserChannelContext.new(@version , @params['service_sid'], @params['user_sid'], @params['channel_sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the User Channel resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the User Channel resource is associated with.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Channel](https://www.twilio.com/docs/chat/channels) the User Channel resource belongs to.
                    def channel_sid
                        @properties['channel_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [User](https://www.twilio.com/docs/chat/rest/user-resource) the User Channel belongs to.
                    def user_sid
                        @properties['user_sid']
                    end
                    
                    ##
                    # @return [String] The SID of a [Member](https://www.twilio.com/docs/chat/rest/member-resource) that represents the User on the Channel.
                    def member_sid
                        @properties['member_sid']
                    end
                    
                    ##
                    # @return [ChannelStatus] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] The index of the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) in the [Channel](https://www.twilio.com/docs/chat/channels) that the Member has read.
                    def last_consumed_message_index
                        @properties['last_consumed_message_index']
                    end
                    
                    ##
                    # @return [String] The number of unread Messages in the Channel for the User. Note that retrieving messages on a client endpoint does not mean that messages are consumed or read. See [Consumption Horizon feature](https://www.twilio.com/docs/chat/consumption-horizon) to learn how to mark messages as consumed.
                    def unread_messages_count
                        @properties['unread_messages_count']
                    end
                    
                    ##
                    # @return [Hash] The absolute URLs of the [Members](https://www.twilio.com/docs/chat/rest/member-resource), [Messages](https://www.twilio.com/docs/chat/rest/message-resource) , [Invites](https://www.twilio.com/docs/chat/rest/invite-resource) and, if it exists, the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) for the Channel.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the User Channel resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [NotificationLevel] 
                    def notification_level
                        @properties['notification_level']
                    end
                    
                    ##
                    # Delete the UserChannelInstance
                    # @param [UserChannelEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        x_twilio_webhook_enabled: :unset
                    )

                        context.delete(
                            x_twilio_webhook_enabled: x_twilio_webhook_enabled, 
                        )
                    end

                    ##
                    # Fetch the UserChannelInstance
                    # @return [UserChannelInstance] Fetched UserChannelInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the UserChannelInstance
                    # @param [NotificationLevel] notification_level 
                    # @param [String] last_consumed_message_index The index of the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) in the [Channel](https://www.twilio.com/docs/chat/channels) that the Member has read.
                    # @param [Time] last_consumption_timestamp The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp of the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) read event for the Member within the [Channel](https://www.twilio.com/docs/chat/channels).
                    # @return [UserChannelInstance] Updated UserChannelInstance
                    def update(
                        notification_level: :unset, 
                        last_consumed_message_index: :unset, 
                        last_consumption_timestamp: :unset
                    )

                        context.update(
                            notification_level: notification_level, 
                            last_consumed_message_index: last_consumed_message_index, 
                            last_consumption_timestamp: last_consumption_timestamp, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Chat.V2.UserChannelInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Chat.V2.UserChannelInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end


