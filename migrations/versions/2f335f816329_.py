"""empty message

Revision ID: 2f335f816329
Revises: 
Create Date: 2024-03-19 16:22:55.368416

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '2f335f816329'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('student', schema=None) as batch_op:
        batch_op.drop_constraint('student_rollno_key', type_='unique')
        batch_op.drop_column('rollno')

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('student', schema=None) as batch_op:
        batch_op.add_column(sa.Column('rollno', sa.INTEGER(), autoincrement=False, nullable=False))
        batch_op.create_unique_constraint('student_rollno_key', ['rollno'])

    # ### end Alembic commands ###
