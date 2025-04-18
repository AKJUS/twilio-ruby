##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Taskrouter
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Taskrouter < TaskrouterBase
            class V1 < Version
                class WorkspaceContext < InstanceContext
                class WorkerContext < InstanceContext

                     class WorkerChannelList < ListResource
                
                    ##
                    # Initialize the WorkerChannelList
                    # @param [Version] version Version that contains the resource
                    # @return [WorkerChannelList] WorkerChannelList
                    def initialize(version, workspace_sid: nil, worker_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { workspace_sid: workspace_sid, worker_sid: worker_sid }
                        @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workers/#{@solution[:worker_sid]}/Channels"
                        
                    end
                
                    ##
                    # Lists WorkerChannelInstance records from the API as a list.
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
                    # When passed a block, yields WorkerChannelInstance records from the API.
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
                    # Retrieve a single page of WorkerChannelInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of WorkerChannelInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        WorkerChannelPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of WorkerChannelInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of WorkerChannelInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    WorkerChannelPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Taskrouter.V1.WorkerChannelList>'
                    end
                end


                class WorkerChannelContext < InstanceContext
                    ##
                    # Initialize the WorkerChannelContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] workspace_sid The SID of the Workspace with the WorkerChannel to update.
                    # @param [String] worker_sid The SID of the Worker with the WorkerChannel to update.
                    # @param [String] sid The SID of the WorkerChannel to update.
                    # @return [WorkerChannelContext] WorkerChannelContext
                    def initialize(version, workspace_sid, worker_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { workspace_sid: workspace_sid, worker_sid: worker_sid, sid: sid,  }
                        @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workers/#{@solution[:worker_sid]}/Channels/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Fetch the WorkerChannelInstance
                    # @return [WorkerChannelInstance] Fetched WorkerChannelInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        WorkerChannelInstance.new(
                            @version,
                            payload,
                            workspace_sid: @solution[:workspace_sid],
                            worker_sid: @solution[:worker_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the WorkerChannelInstance
                    # @param [String] capacity The total number of Tasks that the Worker should handle for the TaskChannel type. TaskRouter creates reservations for Tasks of this TaskChannel type up to the specified capacity. If the capacity is 0, no new reservations will be created.
                    # @param [Boolean] available Whether the WorkerChannel is available. Set to `false` to prevent the Worker from receiving any new Tasks of this TaskChannel type.
                    # @return [WorkerChannelInstance] Updated WorkerChannelInstance
                    def update(
                        capacity: :unset, 
                        available: :unset
                    )

                        data = Twilio::Values.of({
                            'Capacity' => capacity,
                            'Available' => available,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        WorkerChannelInstance.new(
                            @version,
                            payload,
                            workspace_sid: @solution[:workspace_sid],
                            worker_sid: @solution[:worker_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Taskrouter.V1.WorkerChannelContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Taskrouter.V1.WorkerChannelContext #{context}>"
                    end
                end

                class WorkerChannelPage < Page
                    ##
                    # Initialize the WorkerChannelPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [WorkerChannelPage] WorkerChannelPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of WorkerChannelInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [WorkerChannelInstance] WorkerChannelInstance
                    def get_instance(payload)
                        WorkerChannelInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], worker_sid: @solution[:worker_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Taskrouter.V1.WorkerChannelPage>'
                    end
                end
                class WorkerChannelInstance < InstanceResource
                    ##
                    # Initialize the WorkerChannelInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this WorkerChannel
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [WorkerChannelInstance] WorkerChannelInstance
                    def initialize(version, payload , workspace_sid: nil, worker_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'assigned_tasks' => payload['assigned_tasks'] == nil ? payload['assigned_tasks'] : payload['assigned_tasks'].to_i,
                            'available' => payload['available'],
                            'available_capacity_percentage' => payload['available_capacity_percentage'] == nil ? payload['available_capacity_percentage'] : payload['available_capacity_percentage'].to_i,
                            'configured_capacity' => payload['configured_capacity'] == nil ? payload['configured_capacity'] : payload['configured_capacity'].to_i,
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'sid' => payload['sid'],
                            'task_channel_sid' => payload['task_channel_sid'],
                            'task_channel_unique_name' => payload['task_channel_unique_name'],
                            'worker_sid' => payload['worker_sid'],
                            'workspace_sid' => payload['workspace_sid'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'workspace_sid' => workspace_sid  || @properties['workspace_sid']  ,'worker_sid' => worker_sid  || @properties['worker_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [WorkerChannelContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = WorkerChannelContext.new(@version , @params['workspace_sid'], @params['worker_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Worker resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The total number of Tasks assigned to Worker for the TaskChannel type.
                    def assigned_tasks
                        @properties['assigned_tasks']
                    end
                    
                    ##
                    # @return [Boolean] Whether the Worker should receive Tasks of the TaskChannel type.
                    def available
                        @properties['available']
                    end
                    
                    ##
                    # @return [String] The current percentage of capacity the TaskChannel has available. Can be a number between `0` and `100`. A value of `0` indicates that TaskChannel has no capacity available and a value of `100` means the  Worker is available to receive any Tasks of this TaskChannel type.
                    def available_capacity_percentage
                        @properties['available_capacity_percentage']
                    end
                    
                    ##
                    # @return [String] The current configured capacity for the WorkerChannel. TaskRouter will not create any reservations after the assigned Tasks for the Worker reaches the value.
                    def configured_capacity
                        @properties['configured_capacity']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the WorkerChannel resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the TaskChannel.
                    def task_channel_sid
                        @properties['task_channel_sid']
                    end
                    
                    ##
                    # @return [String] The unique name of the TaskChannel, such as `voice` or `sms`.
                    def task_channel_unique_name
                        @properties['task_channel_unique_name']
                    end
                    
                    ##
                    # @return [String] The SID of the Worker that contains the WorkerChannel.
                    def worker_sid
                        @properties['worker_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Workspace that contains the WorkerChannel.
                    def workspace_sid
                        @properties['workspace_sid']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the WorkerChannel resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the WorkerChannelInstance
                    # @return [WorkerChannelInstance] Fetched WorkerChannelInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the WorkerChannelInstance
                    # @param [String] capacity The total number of Tasks that the Worker should handle for the TaskChannel type. TaskRouter creates reservations for Tasks of this TaskChannel type up to the specified capacity. If the capacity is 0, no new reservations will be created.
                    # @param [Boolean] available Whether the WorkerChannel is available. Set to `false` to prevent the Worker from receiving any new Tasks of this TaskChannel type.
                    # @return [WorkerChannelInstance] Updated WorkerChannelInstance
                    def update(
                        capacity: :unset, 
                        available: :unset
                    )

                        context.update(
                            capacity: capacity, 
                            available: available, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Taskrouter.V1.WorkerChannelInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Taskrouter.V1.WorkerChannelInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end


