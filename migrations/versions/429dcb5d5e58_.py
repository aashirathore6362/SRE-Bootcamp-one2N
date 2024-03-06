"""empty message

Revision ID: 429dcb5d5e58
Revises: 
Create Date: 2024-03-06 09:58:29.951832

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '429dcb5d5e58'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('student', schema=None) as batch_op:
        batch_op.add_column(sa.Column('rollno', sa.Integer(), nullable=False))
        batch_op.create_unique_constraint(None, ['rollno'])

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('student', schema=None) as batch_op:
        batch_op.drop_constraint(None, type_='unique')
        batch_op.drop_column('rollno')

    # ### end Alembic commands ###