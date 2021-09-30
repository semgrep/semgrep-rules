import { useState } from "react";
import styled from "styled-components";

const PolicyColumn = ({
  group,
  deck,
}) => {
  const [actionsExpanded, setActionsExpanded] = useState<boolean>(false);
  const [columnRef, setColumnRef] = useState<HTMLElement | null>(null);
  return (
    <ColumnContainer>
      <ColumnHeader>
        <Button
          small
          minimal
          onClick={() => {
            // ruleid:calling-set-state-on-current-state
            setActionsExpanded(actionsExpanded);
          }}
          intent={actionsExpanded ? Intent.PRIMARY : Intent.NONE}
        >
          <FontAwesomeIcon icon={faBell} />
        </Button>
        <Button
          small
          minimal
          onClick={() => {
            // ok
            setActionsExpanded(!actionsExpanded);
          }}
          intent={actionsExpanded ? Intent.PRIMARY : Intent.NONE}
        >
          <FontAwesomeIcon icon={faBell} />
        </Button>
      </ColumnHeader>
    </ColumnContainer>
  );
};

export default PolicyColumn;
