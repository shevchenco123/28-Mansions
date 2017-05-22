classdef DependsOnB < robotics.ros.Message
    %DependsOnB MATLAB implementation of C/DependsOnB
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2017 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'C/DependsOnB' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = '99cd0596a41b5410a3a10312e5ffc1f0' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Constant, Access = protected)
        BStandaloneClass = robotics.ros.msg.internal.MessageFactory.getClassForType('B/Standalone') % Dispatch to MATLAB class for message type B/Standalone
        StdMsgsStringClass = robotics.ros.msg.internal.MessageFactory.getClassForType('std_msgs/String') % Dispatch to MATLAB class for message type std_msgs/String
    end
    
    properties (Dependent)
        StringProperty
        DependentProperty
    end
    
    properties (Access = protected)
        Cache = struct('StringProperty', [], 'DependentProperty', []) % The cache for fast data access
    end
    
    properties (Constant, Hidden)
        PropertyList = {'DependentProperty', 'StringProperty'} % List of non-constant message properties
        ROSPropertyList = {'dependentProperty', 'stringProperty'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = DependsOnB(msg)
            %DependsOnB Construct the message object DependsOnB
            import com.mathworks.toolbox.robotics.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('robotics:ros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('robotics:ros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('robotics:ros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function stringproperty = get.StringProperty(obj)
            %get.StringProperty Get the value for property StringProperty
            if isempty(obj.Cache.StringProperty)
                obj.Cache.StringProperty = feval(obj.StdMsgsStringClass, obj.JavaMessage.getStringProperty);
            end
            stringproperty = obj.Cache.StringProperty;
        end
        
        function set.StringProperty(obj, stringproperty)
            %set.StringProperty Set the value for property StringProperty
            validateattributes(stringproperty, {obj.StdMsgsStringClass}, {'nonempty', 'scalar'}, 'DependsOnB', 'stringproperty');
            
            obj.JavaMessage.setStringProperty(stringproperty.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.StringProperty)
                obj.Cache.StringProperty.setJavaObject(stringproperty.getJavaObject);
            end
        end
        
        function dependentproperty = get.DependentProperty(obj)
            %get.DependentProperty Get the value for property DependentProperty
            if isempty(obj.Cache.DependentProperty)
                obj.Cache.DependentProperty = feval(obj.BStandaloneClass, obj.JavaMessage.getDependentProperty);
            end
            dependentproperty = obj.Cache.DependentProperty;
        end
        
        function set.DependentProperty(obj, dependentproperty)
            %set.DependentProperty Set the value for property DependentProperty
            validateattributes(dependentproperty, {obj.BStandaloneClass}, {'nonempty', 'scalar'}, 'DependsOnB', 'dependentproperty');
            
            obj.JavaMessage.setDependentProperty(dependentproperty.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.DependentProperty)
                obj.Cache.DependentProperty.setJavaObject(dependentproperty.getJavaObject);
            end
        end
    end
    
    methods (Access = protected)
        function resetCache(obj)
            %resetCache Resets any cached properties
            obj.Cache.StringProperty = [];
            obj.Cache.DependentProperty = [];
        end
        
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Clear any existing cached properties
            cpObj.resetCache;
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Recursively copy compound properties
            cpObj.StringProperty = copy(obj.StringProperty);
            cpObj.DependentProperty = copy(obj.DependentProperty);
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.StringProperty = feval([obj.StdMsgsStringClass '.loadobj'], strObj.StringProperty);
            obj.DependentProperty = feval([obj.BStandaloneClass '.loadobj'], strObj.DependentProperty);
        end
    end
    
    methods (Access = ?robotics.ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.StringProperty = saveobj(obj.StringProperty);
            strObj.DependentProperty = saveobj(obj.DependentProperty);
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.C.DependsOnB.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.C.DependsOnB;
            obj.reload(strObj);
        end
    end
end
