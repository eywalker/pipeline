classdef Visual < handle
    % core.Visual is an abstract class from which visual stimuli are derived.
    % core.Visual is a mixin class for stimulus.Condition specialization
    % tables.
    % Subclasses must define the showTrial method to show the trial given
    % the conditions.
    % Subclasses may also override the prepare method to compute additional
    % fields to the conditions.
    % core.Visual is a mixing class for conditions
    
    properties(Constant, Abstract)
        variation % overwrite this in derived classes to specify variations of stimuli with the same class name
    end
    
    properties(Constant)
        screen = stimulus.core.Screen
        DEBUG = true
    end
    
    properties(Dependent)
        win     % PsychToolbox window object to use in showTrial
        rect    % PsychToolbox window rect object to use in showTrial
        fps     % hardware frame rate
    end
    
    methods
        
        function fps = get.fps(self)
            fps = self.screen.fps;
        end
        
        function win = get.win(self)
            win = self.screen.win;
        end
        
        function rect = get.rect(self)
            rect = self.screen.rect;
        end
    end
    
    
    methods(Static)
        function [condition, cache] = make(condition)
            % override to compute additional fields in condition and to
            % pre-compute additional attributes that are not stored and
            % are not computed on the fly in showTrial()
            cache = struct;
        end
    end
    
    methods(Abstract)
        showTrial(self, condition)  % implement in subclass
    end
    
end