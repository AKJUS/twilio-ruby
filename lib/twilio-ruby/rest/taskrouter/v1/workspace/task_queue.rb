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

                     class TaskQueueList < ListResource
                
                    ##
                    # Initialize the TaskQueueList
                    # @param [Version] version Version that contains the resource
                    # @return [TaskQueueList] TaskQueueList
                    def initialize(version, workspace_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { workspace_sid: workspace_sid }
                        @uri = "/Workspaces/#{@solution[:workspace_sid]}/TaskQueues"
                        # Components
                        @bulk_real_time_statistics = nil
                        @statistics = nil
                    end
                    ##
                    # Create the TaskQueueInstance
                    # @param [String] friendly_name A descriptive string that you create to describe the TaskQueue. For example `Support-Tier 1`, `Sales`, or `Escalation`.
                    # @param [String] target_workers A string that describes the Worker selection criteria for any Tasks that enter the TaskQueue. For example, `'\\\"language\\\" == \\\"spanish\\\"'`. The default value is `1==1`. If this value is empty, Tasks will wait in the TaskQueue until they are deleted or moved to another TaskQueue. For more information about Worker selection, see [Describing Worker selection criteria](https://www.twilio.com/docs/taskrouter/api/taskqueues#target-workers).
                    # @param [String] max_reserved_workers The maximum number of Workers to reserve for the assignment of a Task in the queue. Can be an integer between 1 and 50, inclusive and defaults to 1.
                    # @param [TaskOrder] task_order 
                    # @param [String] reservation_activity_sid The SID of the Activity to assign Workers when a task is reserved for them.
                    # @param [String] assignment_activity_sid The SID of the Activity to assign Workers when a task is assigned to them.
                    # @return [TaskQueueInstance] Created TaskQueueInstance
                    def create(
                        friendly_name: nil, 
                        target_workers: :unset, 
                        max_reserved_workers: :unset, 
                        task_order: :unset, 
                        reservation_activity_sid: :unset, 
                        assignment_activity_sid: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'TargetWorkers' => target_workers,
                            'MaxReservedWorkers' => max_reserved_workers,
                            'TaskOrder' => task_order,
                            'ReservationActivitySid' => reservation_activity_sid,
                            'AssignmentActivitySid' => assignment_activity_sid,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        TaskQueueInstance.new(
                            @version,
                            payload,
                            workspace_sid: @solution[:workspace_sid],
                        )
                    end

                
                    ##
                    # Lists TaskQueueInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] friendly_name The `friendly_name` of the TaskQueue resources to read.
                    # @param [String] evaluate_worker_attributes The attributes of the Workers to read. Returns the TaskQueues with Workers that match the attributes specified in this parameter.
                    # @param [String] worker_sid The SID of the Worker with the TaskQueue resources to read.
                    # @param [String] ordering Sorting parameter for TaskQueues
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(friendly_name: :unset, evaluate_worker_attributes: :unset, worker_sid: :unset, ordering: :unset, limit: nil, page_size: nil)
                        self.stream(
                            friendly_name: friendly_name,
                            evaluate_worker_attributes: evaluate_worker_attributes,
                            worker_sid: worker_sid,
                            ordering: ordering,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] friendly_name The `friendly_name` of the TaskQueue resources to read.
                    # @param [String] evaluate_worker_attributes The attributes of the Workers to read. Returns the TaskQueues with Workers that match the attributes specified in this parameter.
                    # @param [String] worker_sid The SID of the Worker with the TaskQueue resources to read.
                    # @param [String] ordering Sorting parameter for TaskQueues
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(friendly_name: :unset, evaluate_worker_attributes: :unset, worker_sid: :unset, ordering: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            friendly_name: friendly_name,
                            evaluate_worker_attributes: evaluate_worker_attributes,
                            worker_sid: worker_sid,
                            ordering: ordering,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields TaskQueueInstance records from the API.
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
                    # Retrieve a single page of TaskQueueInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] friendly_name The `friendly_name` of the TaskQueue resources to read.
                    # @param [String] evaluate_worker_attributes The attributes of the Workers to read. Returns the TaskQueues with Workers that match the attributes specified in this parameter.
                    # @param [String] worker_sid The SID of the Worker with the TaskQueue resources to read.
                    # @param [String] ordering Sorting parameter for TaskQueues
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of TaskQueueInstance
                    def page(friendly_name: :unset, evaluate_worker_attributes: :unset, worker_sid: :unset, ordering: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'EvaluateWorkerAttributes' => evaluate_worker_attributes,
                            'WorkerSid' => worker_sid,
                            'Ordering' => ordering,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        TaskQueuePage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of TaskQueueInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of TaskQueueInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    TaskQueuePage.new(@version, response, @solution)
                    end
                    

                ##
                # Access the bulk_real_time_statistics
                # @return [TaskQueueBulkRealTimeStatisticsList]
                # @return [TaskQueueBulkRealTimeStatisticsContext]
                def bulk_real_time_statistics
                    @bulk_real_time_statistics ||= TaskQueueBulkRealTimeStatisticsList.new(@version, workspace_sid: @solution[:workspace_sid] )
                end
                ##
                # Access the statistics
                # @return [TaskQueuesStatisticsList]
                # @return [TaskQueuesStatisticsContext]
                def statistics
                    @statistics ||= TaskQueuesStatisticsList.new(@version, workspace_sid: @solution[:workspace_sid] )
                end

                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Taskrouter.V1.TaskQueueList>'
                    end
                end


                class TaskQueueContext < InstanceContext
                    ##
                    # Initialize the TaskQueueContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] workspace_sid The SID of the Workspace with the TaskQueue to update.
                    # @param [String] sid The SID of the TaskQueue resource to update.
                    # @return [TaskQueueContext] TaskQueueContext
                    def initialize(version, workspace_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { workspace_sid: workspace_sid, sid: sid,  }
                        @uri = "/Workspaces/#{@solution[:workspace_sid]}/TaskQueues/#{@solution[:sid]}"

                        # Dependents
                        @cumulative_statistics = nil
                        @statistics = nil
                        @real_time_statistics = nil
                    end
                    ##
                    # Delete the TaskQueueInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the TaskQueueInstance
                    # @return [TaskQueueInstance] Fetched TaskQueueInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        TaskQueueInstance.new(
                            @version,
                            payload,
                            workspace_sid: @solution[:workspace_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the TaskQueueInstance
                    # @param [String] friendly_name A descriptive string that you create to describe the TaskQueue. For example `Support-Tier 1`, `Sales`, or `Escalation`.
                    # @param [String] target_workers A string describing the Worker selection criteria for any Tasks that enter the TaskQueue. For example '\\\"language\\\" == \\\"spanish\\\"' If no TargetWorkers parameter is provided, Tasks will wait in the queue until they are either deleted or moved to another queue. Additional examples on how to describing Worker selection criteria below.
                    # @param [String] reservation_activity_sid The SID of the Activity to assign Workers when a task is reserved for them.
                    # @param [String] assignment_activity_sid The SID of the Activity to assign Workers when a task is assigned for them.
                    # @param [String] max_reserved_workers The maximum number of Workers to create reservations for the assignment of a task while in the queue. Maximum of 50.
                    # @param [TaskOrder] task_order 
                    # @return [TaskQueueInstance] Updated TaskQueueInstance
                    def update(
                        friendly_name: :unset, 
                        target_workers: :unset, 
                        reservation_activity_sid: :unset, 
                        assignment_activity_sid: :unset, 
                        max_reserved_workers: :unset, 
                        task_order: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'TargetWorkers' => target_workers,
                            'ReservationActivitySid' => reservation_activity_sid,
                            'AssignmentActivitySid' => assignment_activity_sid,
                            'MaxReservedWorkers' => max_reserved_workers,
                            'TaskOrder' => task_order,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        TaskQueueInstance.new(
                            @version,
                            payload,
                            workspace_sid: @solution[:workspace_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the cumulative_statistics
                    # @return [TaskQueueCumulativeStatisticsList]
                    # @return [TaskQueueCumulativeStatisticsContext]
                    def cumulative_statistics
                        TaskQueueCumulativeStatisticsContext.new(
                                @version,
                                @solution[:workspace_sid],
                                @solution[:sid]
                                )
                    end
                    ##
                    # Access the statistics
                    # @return [TaskQueueStatisticsList]
                    # @return [TaskQueueStatisticsContext]
                    def statistics
                        TaskQueueStatisticsContext.new(
                                @version,
                                @solution[:workspace_sid],
                                @solution[:sid]
                                )
                    end
                    ##
                    # Access the real_time_statistics
                    # @return [TaskQueueRealTimeStatisticsList]
                    # @return [TaskQueueRealTimeStatisticsContext]
                    def real_time_statistics
                        TaskQueueRealTimeStatisticsContext.new(
                                @version,
                                @solution[:workspace_sid],
                                @solution[:sid]
                                )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Taskrouter.V1.TaskQueueContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Taskrouter.V1.TaskQueueContext #{context}>"
                    end
                end

                class TaskQueuePage < Page
                    ##
                    # Initialize the TaskQueuePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [TaskQueuePage] TaskQueuePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of TaskQueueInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [TaskQueueInstance] TaskQueueInstance
                    def get_instance(payload)
                        TaskQueueInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Taskrouter.V1.TaskQueuePage>'
                    end
                end
                class TaskQueueInstance < InstanceResource
                    ##
                    # Initialize the TaskQueueInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this TaskQueue
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [TaskQueueInstance] TaskQueueInstance
                    def initialize(version, payload , workspace_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'assignment_activity_sid' => payload['assignment_activity_sid'],
                            'assignment_activity_name' => payload['assignment_activity_name'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'friendly_name' => payload['friendly_name'],
                            'max_reserved_workers' => payload['max_reserved_workers'] == nil ? payload['max_reserved_workers'] : payload['max_reserved_workers'].to_i,
                            'reservation_activity_sid' => payload['reservation_activity_sid'],
                            'reservation_activity_name' => payload['reservation_activity_name'],
                            'sid' => payload['sid'],
                            'target_workers' => payload['target_workers'],
                            'task_order' => payload['task_order'],
                            'url' => payload['url'],
                            'workspace_sid' => payload['workspace_sid'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'workspace_sid' => workspace_sid  || @properties['workspace_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [TaskQueueContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = TaskQueueContext.new(@version , @params['workspace_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the TaskQueue resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Activity to assign Workers when a task is assigned for them.
                    def assignment_activity_sid
                        @properties['assignment_activity_sid']
                    end
                    
                    ##
                    # @return [String] The name of the Activity to assign Workers when a task is assigned for them.
                    def assignment_activity_name
                        @properties['assignment_activity_name']
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
                    # @return [String] The string that you assigned to describe the resource.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] The maximum number of Workers to reserve for the assignment of a task in the queue. Can be an integer between 1 and 50, inclusive and defaults to 1.
                    def max_reserved_workers
                        @properties['max_reserved_workers']
                    end
                    
                    ##
                    # @return [String] The SID of the Activity to assign Workers once a task is reserved for them.
                    def reservation_activity_sid
                        @properties['reservation_activity_sid']
                    end
                    
                    ##
                    # @return [String] The name of the Activity to assign Workers once a task is reserved for them.
                    def reservation_activity_name
                        @properties['reservation_activity_name']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the TaskQueue resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] A string describing the Worker selection criteria for any Tasks that enter the TaskQueue. For example `'\"language\" == \"spanish\"'` If no TargetWorkers parameter is provided, Tasks will wait in the TaskQueue until they are either deleted or moved to another TaskQueue. Additional examples on how to describing Worker selection criteria below. Defaults to 1==1.
                    def target_workers
                        @properties['target_workers']
                    end
                    
                    ##
                    # @return [TaskOrder] 
                    def task_order
                        @properties['task_order']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the TaskQueue resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] The SID of the Workspace that contains the TaskQueue.
                    def workspace_sid
                        @properties['workspace_sid']
                    end
                    
                    ##
                    # @return [Hash] The URLs of related resources.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Delete the TaskQueueInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the TaskQueueInstance
                    # @return [TaskQueueInstance] Fetched TaskQueueInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the TaskQueueInstance
                    # @param [String] friendly_name A descriptive string that you create to describe the TaskQueue. For example `Support-Tier 1`, `Sales`, or `Escalation`.
                    # @param [String] target_workers A string describing the Worker selection criteria for any Tasks that enter the TaskQueue. For example '\\\"language\\\" == \\\"spanish\\\"' If no TargetWorkers parameter is provided, Tasks will wait in the queue until they are either deleted or moved to another queue. Additional examples on how to describing Worker selection criteria below.
                    # @param [String] reservation_activity_sid The SID of the Activity to assign Workers when a task is reserved for them.
                    # @param [String] assignment_activity_sid The SID of the Activity to assign Workers when a task is assigned for them.
                    # @param [String] max_reserved_workers The maximum number of Workers to create reservations for the assignment of a task while in the queue. Maximum of 50.
                    # @param [TaskOrder] task_order 
                    # @return [TaskQueueInstance] Updated TaskQueueInstance
                    def update(
                        friendly_name: :unset, 
                        target_workers: :unset, 
                        reservation_activity_sid: :unset, 
                        assignment_activity_sid: :unset, 
                        max_reserved_workers: :unset, 
                        task_order: :unset
                    )

                        context.update(
                            friendly_name: friendly_name, 
                            target_workers: target_workers, 
                            reservation_activity_sid: reservation_activity_sid, 
                            assignment_activity_sid: assignment_activity_sid, 
                            max_reserved_workers: max_reserved_workers, 
                            task_order: task_order, 
                        )
                    end

                    ##
                    # Access the cumulative_statistics
                    # @return [cumulative_statistics] cumulative_statistics
                    def cumulative_statistics
                        context.cumulative_statistics
                    end

                    ##
                    # Access the statistics
                    # @return [statistics] statistics
                    def statistics
                        context.statistics
                    end

                    ##
                    # Access the real_time_statistics
                    # @return [real_time_statistics] real_time_statistics
                    def real_time_statistics
                        context.real_time_statistics
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Taskrouter.V1.TaskQueueInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Taskrouter.V1.TaskQueueInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


