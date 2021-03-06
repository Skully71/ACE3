/*
 * Author: GitHawk
 * Starts progress bar for picking up a specific kind of magazine from the ground.
 *
 * Arguments:
 * 0: Ammo Dummy <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [target, player] call ace_rearm_fnc_pickUpAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_target", objNull, [objNull]], ["_unit", objNull, [objNull]]];

_dummy = _unit getVariable [QGVAR(dummy), objNull];
if !(isNull _dummy) exitWith {};

//_target attachTo [_unit, [0,0.7,0], "pelvis"];
_target attachTo [_unit, [0,1,0], "pelvis"];
{
    [QGVAR(makeDummyEH), [_dummy, [[-1,0,0],[0,0,1]]], _x] call CBA_fnc_targetEvent;
} count (position _unit nearObjects ["CAManBase", 100]);
_unit setVariable [QGVAR(dummy), _target];
//_unit setVariable [QEGVAR(dragging,isCarrying), true, true];  // breaks things, since it hides interact menu on _target
