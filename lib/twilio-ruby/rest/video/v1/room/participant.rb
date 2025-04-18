##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Video
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Video < VideoBase
            class V1 < Version
                class RoomContext < InstanceContext

                     class ParticipantList < ListResource
                
                    ##
                    # Initialize the ParticipantList
                    # @param [Version] version Version that contains the resource
                    # @return [ParticipantList] ParticipantList
                    def initialize(version, room_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { room_sid: room_sid }
                        @uri = "/Rooms/#{@solution[:room_sid]}/Participants"
                        
                    end
                
                    ##
                    # Lists ParticipantInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Status] status Read only the participants with this status. Can be: `connected` or `disconnected`. For `in-progress` Rooms the default Status is `connected`, for `completed` Rooms only `disconnected` Participants are returned.
                    # @param [String] identity Read only the Participants with this [User](https://www.twilio.com/docs/chat/rest/user-resource) `identity` value.
                    # @param [Time] date_created_after Read only Participants that started after this date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.
                    # @param [Time] date_created_before Read only Participants that started before this date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(status: :unset, identity: :unset, date_created_after: :unset, date_created_before: :unset, limit: nil, page_size: nil)
                        self.stream(
                            status: status,
                            identity: identity,
                            date_created_after: date_created_after,
                            date_created_before: date_created_before,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Status] status Read only the participants with this status. Can be: `connected` or `disconnected`. For `in-progress` Rooms the default Status is `connected`, for `completed` Rooms only `disconnected` Participants are returned.
                    # @param [String] identity Read only the Participants with this [User](https://www.twilio.com/docs/chat/rest/user-resource) `identity` value.
                    # @param [Time] date_created_after Read only Participants that started after this date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.
                    # @param [Time] date_created_before Read only Participants that started before this date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(status: :unset, identity: :unset, date_created_after: :unset, date_created_before: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            status: status,
                            identity: identity,
                            date_created_after: date_created_after,
                            date_created_before: date_created_before,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields ParticipantInstance records from the API.
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
                    # Retrieve a single page of ParticipantInstance records from the API.
                    # Request is executed immediately.
                    # @param [Status] status Read only the participants with this status. Can be: `connected` or `disconnected`. For `in-progress` Rooms the default Status is `connected`, for `completed` Rooms only `disconnected` Participants are returned.
                    # @param [String] identity Read only the Participants with this [User](https://www.twilio.com/docs/chat/rest/user-resource) `identity` value.
                    # @param [Time] date_created_after Read only Participants that started after this date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.
                    # @param [Time] date_created_before Read only Participants that started before this date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of ParticipantInstance
                    def page(status: :unset, identity: :unset, date_created_after: :unset, date_created_before: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Status' => status,
                            'Identity' => identity,
                            'DateCreatedAfter' =>  Twilio.serialize_iso8601_datetime(date_created_after),
                            'DateCreatedBefore' =>  Twilio.serialize_iso8601_datetime(date_created_before),
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        ParticipantPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of ParticipantInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of ParticipantInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    ParticipantPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Video.V1.ParticipantList>'
                    end
                end


                class ParticipantContext < InstanceContext
                    ##
                    # Initialize the ParticipantContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] room_sid The SID of the room with the participant to update.
                    # @param [String] sid The SID of the RoomParticipant resource to update.
                    # @return [ParticipantContext] ParticipantContext
                    def initialize(version, room_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { room_sid: room_sid, sid: sid,  }
                        @uri = "/Rooms/#{@solution[:room_sid]}/Participants/#{@solution[:sid]}"

                        # Dependents
                        @subscribe_rules = nil
                        @subscribed_tracks = nil
                        @anonymize = nil
                        @published_tracks = nil
                    end
                    ##
                    # Fetch the ParticipantInstance
                    # @return [ParticipantInstance] Fetched ParticipantInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        ParticipantInstance.new(
                            @version,
                            payload,
                            room_sid: @solution[:room_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the ParticipantInstance
                    # @param [Status] status 
                    # @return [ParticipantInstance] Updated ParticipantInstance
                    def update(
                        status: :unset
                    )

                        data = Twilio::Values.of({
                            'Status' => status,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        ParticipantInstance.new(
                            @version,
                            payload,
                            room_sid: @solution[:room_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the subscribe_rules
                    # @return [SubscribeRulesList]
                    # @return [SubscribeRulesContext]
                    def subscribe_rules
                      unless @subscribe_rules
                        @subscribe_rules = SubscribeRulesList.new(
                                @version, room_sid: @solution[:room_sid], participant_sid: @solution[:sid], )
                      end
                      @subscribe_rules
                    end
                    ##
                    # Access the subscribed_tracks
                    # @return [SubscribedTrackList]
                    # @return [SubscribedTrackContext] if sid was passed.
                    def subscribed_tracks(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return SubscribedTrackContext.new(@version, @solution[:room_sid], @solution[:sid],sid )
                        end

                        unless @subscribed_tracks
                            @subscribed_tracks = SubscribedTrackList.new(
                                @version, room_sid: @solution[:room_sid], participant_sid: @solution[:sid], )
                        end

                     @subscribed_tracks
                    end
                    ##
                    # Access the anonymize
                    # @return [AnonymizeList]
                    # @return [AnonymizeContext]
                    def anonymize
                        AnonymizeContext.new(
                                @version,
                                @solution[:room_sid],
                                @solution[:sid]
                                )
                    end
                    ##
                    # Access the published_tracks
                    # @return [PublishedTrackList]
                    # @return [PublishedTrackContext] if sid was passed.
                    def published_tracks(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return PublishedTrackContext.new(@version, @solution[:room_sid], @solution[:sid],sid )
                        end

                        unless @published_tracks
                            @published_tracks = PublishedTrackList.new(
                                @version, room_sid: @solution[:room_sid], participant_sid: @solution[:sid], )
                        end

                     @published_tracks
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Video.V1.ParticipantContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Video.V1.ParticipantContext #{context}>"
                    end
                end

                class ParticipantPage < Page
                    ##
                    # Initialize the ParticipantPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ParticipantPage] ParticipantPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ParticipantInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ParticipantInstance] ParticipantInstance
                    def get_instance(payload)
                        ParticipantInstance.new(@version, payload, room_sid: @solution[:room_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Video.V1.ParticipantPage>'
                    end
                end
                class ParticipantInstance < InstanceResource
                    ##
                    # Initialize the ParticipantInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Participant
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ParticipantInstance] ParticipantInstance
                    def initialize(version, payload , room_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'room_sid' => payload['room_sid'],
                            'account_sid' => payload['account_sid'],
                            'status' => payload['status'],
                            'identity' => payload['identity'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'start_time' => Twilio.deserialize_iso8601_datetime(payload['start_time']),
                            'end_time' => Twilio.deserialize_iso8601_datetime(payload['end_time']),
                            'duration' => payload['duration'] == nil ? payload['duration'] : payload['duration'].to_i,
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'room_sid' => room_sid  || @properties['room_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ParticipantContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ParticipantContext.new(@version , @params['room_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the RoomParticipant resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the participant's room.
                    def room_sid
                        @properties['room_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the RoomParticipant resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] The application-defined string that uniquely identifies the resource's User within a Room. If a client joins with an existing Identity, the existing client is disconnected. See [access tokens](https://www.twilio.com/docs/video/tutorials/user-identity-access-tokens) and [limits](https://www.twilio.com/docs/video/programmable-video-limits) for more info. 
                    def identity
                        @properties['identity']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [Time] The time of participant connected to the room in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.
                    def start_time
                        @properties['start_time']
                    end
                    
                    ##
                    # @return [Time] The time when the participant disconnected from the room in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.
                    def end_time
                        @properties['end_time']
                    end
                    
                    ##
                    # @return [String] The duration in seconds that the participant was `connected`. Populated only after the participant is `disconnected`.
                    def duration
                        @properties['duration']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] The URLs of related resources.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Fetch the ParticipantInstance
                    # @return [ParticipantInstance] Fetched ParticipantInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the ParticipantInstance
                    # @param [Status] status 
                    # @return [ParticipantInstance] Updated ParticipantInstance
                    def update(
                        status: :unset
                    )

                        context.update(
                            status: status, 
                        )
                    end

                    ##
                    # Access the subscribe_rules
                    # @return [subscribe_rules] subscribe_rules
                    def subscribe_rules
                        context.subscribe_rules
                    end

                    ##
                    # Access the subscribed_tracks
                    # @return [subscribed_tracks] subscribed_tracks
                    def subscribed_tracks
                        context.subscribed_tracks
                    end

                    ##
                    # Access the anonymize
                    # @return [anonymize] anonymize
                    def anonymize
                        context.anonymize
                    end

                    ##
                    # Access the published_tracks
                    # @return [published_tracks] published_tracks
                    def published_tracks
                        context.published_tracks
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Video.V1.ParticipantInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Video.V1.ParticipantInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


